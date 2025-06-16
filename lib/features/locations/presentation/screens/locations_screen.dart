import 'package:ashafaq/config/shared/buttons/custom_elevated_button.dart';
import 'package:ashafaq/config/shared/custom_loading_indicator.dart';
import 'package:ashafaq/config/shared/layout/drawer_page_base_layout.dart';
import 'package:ashafaq/config/shared/no_content_widget_with_button.dart';
import 'package:ashafaq/config/shared/no_internet_connection_widget.dart';
import 'package:ashafaq/features/locations/presentation/screens/add_location_screen.dart';
import 'package:ashafaq/features/locations/presentation/screens/locations_cubit/locations_cubit.dart';
import 'package:ashafaq/features/locations/presentation/widgets/components/location_card.dart';
import 'package:ashafaq/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LocationsScreen extends StatefulWidget {
  const LocationsScreen({super.key});
  static const pageRoute = '/locations-screen';

  @override
  State<LocationsScreen> createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {
  void getData() {
    context.read<LocationsCubit>().getLocations();
  }

  @override
  void initState() {
    getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return DrawerPageBaseLayout(
      title: appLocalizations.my(appLocalizations.locations),
      appBarTrailing: CustomElevatedButton(
        width: 100,
        text: '+ ${appLocalizations.add('')}',
        btnColor: const Color(0x1f2E93B9),
        textColor: Colors.black,
        onPressed: () => context.push(AddLocationScreen.pageRoute),
      ),
      content: BlocBuilder<LocationsCubit, LocationsState>(
        builder: (context, state) {
          if (state is GotLocationsState) {
            final locations = state.locations;
            return ListView.builder(
              itemCount: locations.length,
              itemBuilder: (context, index) {
                final location = locations[index];
                return LocationListTile(location: location);
              },
            );
          }
          if (state is LocationsLoadingState) {
            return const CustomLoadingIndicator();
          }
          if (state is NoLocationsState) {
            return NoContentWidgetWithButton(
              label: appLocalizations.noContent(appLocalizations.locations),
              refresh: () => context.read<LocationsCubit>().getLocations(),
            );
          } else if (state is LocationsNoInternetState) {
            return NoInternetConnectionWidget(onPressed: () => getData());
          }
          if (state is LocationsErrorState) {
            return NoContentWidgetWithButton(
              label: appLocalizations.noContent(appLocalizations.locations),
              refresh: () => context.read<LocationsCubit>().getLocations(),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
