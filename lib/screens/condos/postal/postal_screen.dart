import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/models/package.dart';
import 'package:rmp_flutter/repositories/package_repository.dart';
import 'package:rmp_flutter/screens/condos/postal/package_detail_screen.dart';
import 'package:rmp_flutter/utils/date_format.dart';
import 'package:rmp_flutter/widgets/general/centered_progress_indicator.dart';
import 'package:rmp_flutter/widgets/general/package_card.dart';

class PostalScreen extends HookWidget {
  static const routeName = "/condo/postal";
  const PostalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _packages = useState(PackagesModel(packages: []));
    final _isLoading = useState(true);

    void _fetchPackages() async {
      _isLoading.value = true;
      _packages.value = await PackageRepository().getPackages("in-storage");
      _isLoading.value = false;
    }

    useEffect(() {
      _fetchPackages();
    }, []);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[
            kBrandColor,
            kBrandAlternativeDarkerColor,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: kSizeS,
              horizontal: kSizeS * 1.5,
            ),
            child: Column(
              children: [
                Text(
                  "Postal Management",
                  style: Theme.of(context).textTheme.headline3?.copyWith(
                        color: kLightColor,
                      ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                left: kSizeS * 1.5,
                right: kSizeS * 1.5,
                top: kSizeS,
              ),
              decoration: BoxDecoration(
                color: kBgColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                    kSizeS,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "All Packages",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  kSizedBoxVerticalS,
                  Expanded(
                    child: _isLoading.value
                        ? CenteredProgressIndicator()
                        : ListView.builder(
                            itemCount: _packages.value.packages.length,
                            itemBuilder: (ctx, index) {
                              Package pk = _packages.value.packages[index];
                              return PackageCard(
                                title: pk.roomNumber,
                                date: formattedDate(pk.arrivedAt),
                                note: pk.note.isEmpty ? "-" : pk.note,
                                onPressed: () => Navigator.of(context)
                                    .pushNamed(PackageDetailScreen.routeName,
                                        arguments: pk.id)
                                    .then((value) => _fetchPackages()),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
