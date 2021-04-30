import 'package:delivery_service/app/localization/localization_keys.dart';
import 'package:delivery_service/app/theme/branding_colors.dart';
import 'package:delivery_service/app/theme/insets.dart';
import 'package:delivery_service/pages/base/base_bloc.dart';
import 'package:delivery_service/pages/base/base_page_state.dart';
import 'package:delivery_service/pages/promo/promo_bloc.dart';
import 'package:delivery_service/services/registry_service.dart';
import 'package:delivery_service/widgets/promo_info_card.dart';
import 'package:delivery_service/widgets/shimmer_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';

class PromoPage extends StatefulWidget {
  const PromoPage({Key key}) : super(key: key);

  @override
  State<PromoPage> createState() => _PromoPageState();
}

class _PromoPageState extends BasePageState<PromoBloc, PromoPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PromoBloc, BaseState>(
      bloc: bloc,
      builder: (_, state) {
        return Scaffold(
          backgroundColor: BrandingColors.background,
          appBar: AppBar(
            title: Text(
              translate(LocalizationKeys.Promo_Title),
              style: textTheme.headline4,
            ),
          ),
          body: _buildBody(state),
        );
      },
    );
  }

  Widget _buildBody(BaseState state) => SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: _getSliverFromState(state),
        ),
      );

  List<Widget> _getSliverFromState(BaseState state) {
    if (state is InitialState) {
      return _getShimmerSlivers();
    } else {
      return _getContentSlivers();
    }
  }

  List<Widget> _getShimmerSlivers() => [
        _buildShimmerList(),
        _buildBottomSpacingSliver(),
      ];

  List<Widget> _getContentSlivers() => [
        CupertinoSliverRefreshControl(
          refreshTriggerPullDistance: 170,
          onRefresh: () async => bloc.add(BaseEvent.refresh()),
        ),
        if (bloc.promosList.isNotEmpty) _buildPromoList(),
        _buildBottomSpacingSliver(),
      ];

  Widget _buildPromoList() => SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, index) => Padding(
            padding: const EdgeInsets.all(Insets.x2),
            child: SizedBox(
              height: 200,
              child: PromoInfoCard(
                model: bloc.promosList[index],
              ),
            ),
          ),
          childCount: bloc.promosList.length,
        ),
      );

  Widget _buildShimmerList() => SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, index) => Padding(
            padding: const EdgeInsets.all(Insets.x2),
            child: SizedBox(
              height: 200,
              child: ShimmerCard(),
            ),
          ),
          childCount: 5,
        ),
      );

  Widget _buildBottomSpacingSliver() =>
      SliverToBoxAdapter(child: SizedBox(height: kBottomNavigationBarHeight));
}
