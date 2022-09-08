import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/presentation/icons.dart';
import '../../../../../../core/presentation/styles_manager.dart';
import '../../../../../forcastDatabase/presentation/cubit/forcastdatabase_cubit.dart';
import '../../../widgets/search_item_builder.dart';
import '../../search/search_for_city_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForcastDatabaseCubit, ForcastDatabaseState>(
      builder: (context, state) {
        var cubit = ForcastDatabaseCubit.get(context).cities;
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Text(
                'Pick location',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'Find the area or city that you want to know the detailed weather info at this time',
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30.0),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: TextFormField(
                      style: getLightStyle(
                        color: Colors.white,
                      ),
                      readOnly: true,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SerchForAreaView(),
                          fullscreenDialog: true,
                        ),
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(
                          IconBroken.search,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: ShapeDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(35.0),
                        ),
                      ),
                      child: const Icon(
                        IconBroken.location,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25.0),
              if (cubit != null) ...[
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: cubit.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 20.0,
                    mainAxisExtent: 180
                  ),
                  itemBuilder: (ctx, i) {
                    return SearchItemOfSearchView(
                      forcast: cubit[i],
                      i: i,
                    );
                  },
                ),
              ] else ...[
                Center(
                  child: Text(
                    'Go search for some cities',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                )
              ],
            ],
          ),
        );
      },
    );
  }
}
