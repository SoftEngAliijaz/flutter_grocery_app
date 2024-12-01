import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_grocery_app/helpers/services/auth_services.dart';
import 'package:flutter_grocery_app/views/auth/forgot_password_screen.dart';
import 'package:flutter_grocery_app/views/auth/login_screen.dart';
import 'package:flutter_grocery_app/views/auth/register_account_screen.dart';
import 'package:flutter_grocery_app/views/auth/reset_password_screen.dart';
import 'package:flutter_grocery_app/views/home_screen.dart';
import 'package:flutter_grocery_app/views/ui/basic_table_screen.dart';
import 'package:flutter_grocery_app/views/ui/buttons_screen.dart';
import 'package:flutter_grocery_app/views/ui/cards_screen.dart';
import 'package:flutter_grocery_app/views/ui/carousels_screen.dart';
import 'package:flutter_grocery_app/views/ui/cart_screen.dart';
import 'package:flutter_grocery_app/views/ui/chat_screen.dart';
import 'package:flutter_grocery_app/views/ui/customer/add_customer_screen.dart';
import 'package:flutter_grocery_app/views/ui/customer/customer_detail_screen.dart';
import 'package:flutter_grocery_app/views/ui/customer/customer_list_screen.dart';
import 'package:flutter_grocery_app/views/ui/customer/edit_customer_screen.dart';
import 'package:flutter_grocery_app/views/ui/dashboard_screen.dart';
import 'package:flutter_grocery_app/views/ui/dialogs_screen.dart';
import 'package:flutter_grocery_app/views/ui/drag_n_drop_screen.dart';
import 'package:flutter_grocery_app/views/ui/error_pages/coming_soon_screen.dart';
import 'package:flutter_grocery_app/views/ui/error_pages/error_404_screen.dart';
import 'package:flutter_grocery_app/views/ui/error_pages/error_500_screen.dart';
import 'package:flutter_grocery_app/views/ui/extra_pages/faqs_screen.dart';
import 'package:flutter_grocery_app/views/ui/extra_pages/pricing_screen.dart';
import 'package:flutter_grocery_app/views/ui/extra_pages/time_line_screen.dart';
import 'package:flutter_grocery_app/views/ui/forms/basic_input_screen.dart';
import 'package:flutter_grocery_app/views/ui/forms/custom_option_screen.dart';
import 'package:flutter_grocery_app/views/ui/forms/editor_screen.dart';
import 'package:flutter_grocery_app/views/ui/forms/file_upload_screen.dart';
import 'package:flutter_grocery_app/views/ui/forms/mask_screen.dart';
import 'package:flutter_grocery_app/views/ui/forms/slider_screen.dart';
import 'package:flutter_grocery_app/views/ui/forms/validation_screen.dart';
import 'package:flutter_grocery_app/views/ui/grocery/add_grocery_screen.dart';
import 'package:flutter_grocery_app/views/ui/grocery/grocery_detail_screen.dart';
import 'package:flutter_grocery_app/views/ui/grocery/grocery_edit_screen.dart';
import 'package:flutter_grocery_app/views/ui/grocery/grocery_list_screen.dart';
import 'package:flutter_grocery_app/views/ui/grocery_screen.dart';
import 'package:flutter_grocery_app/views/ui/loaders_screen.dart';
import 'package:flutter_grocery_app/views/ui/modal_screen.dart';
import 'package:flutter_grocery_app/views/ui/notification_screen.dart';
import 'package:flutter_grocery_app/views/ui/order/order_detail_screen.dart';
import 'package:flutter_grocery_app/views/ui/order/order_list_screen.dart';
import 'package:flutter_grocery_app/views/ui/order_screen.dart';
import 'package:flutter_grocery_app/views/ui/seller/add_seller_screen.dart';
import 'package:flutter_grocery_app/views/ui/seller/seller_detail_screen.dart';
import 'package:flutter_grocery_app/views/ui/seller/seller_edit_screen.dart';
import 'package:flutter_grocery_app/views/ui/seller/seller_list_screen.dart';
import 'package:flutter_grocery_app/views/ui/setting_screen.dart';
import 'package:flutter_grocery_app/views/ui/shop/add_shop_screen.dart';
import 'package:flutter_grocery_app/views/ui/shop/edit_shop_screen.dart';
import 'package:flutter_grocery_app/views/ui/shop/shop_detail_screen.dart';
import 'package:flutter_grocery_app/views/ui/shop/shop_list_screen.dart';
import 'package:flutter_grocery_app/views/ui/tabs_screen.dart';
import 'package:flutter_grocery_app/views/ui/toast_message_screen.dart';
import 'package:flutter_grocery_app/views/ui/wallet_screen.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return AuthService.isLoggedIn
        ? null
        : const RouteSettings(name: '/auth/login');
  }
}

getPageRoute() {
  var routes = [
    GetPage(
        name: '/',
        page: () => const HomeScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/home',
        page: () => const HomeScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/dashboard',
        page: () => const DashboardScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(name: '/auth/login', page: () => const LoginScreen()),
    GetPage(
        name: '/auth/register_account',
        page: () => const RegisterAccountScreen()),
    GetPage(
        name: '/auth/forgot_password',
        page: () => const ForgotPasswordScreen()),
    GetPage(
        name: '/auth/reset_password', page: () => const ResetPasswordScreen()),
    GetPage(
        name: '/admin/orders',
        page: () => const OrderListScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/admin/orders/detail',
        page: () => const OrderDetailScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/admin/customers',
        page: () => const CustomerListScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/admin/customers/detail',
        page: () => const CustomerDetailScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/admin/customers/create',
        page: () => const AddCustomerScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/admin/customers/edit',
        page: () => const EditCustomerScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/admin/sellers',
        page: () => const SellerListScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/admin/sellers/detail',
        page: () => const SellerDetailScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/admin/sellers/create',
        page: () => const AddSellerScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/admin/sellers/edit',
        page: () => const SellerEditScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/admin/shop',
        page: () => const ShopListScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/admin/shop/detail',
        page: () => const ShopDetailScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/admin/shop/create',
        page: () => const AddShopScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/admin/shop/edit',
        page: () => const EditShopScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/admin/food',
        page: () => const GroceryListScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/admin/grocery/detail',
        page: () => const GroceryDetailScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/admin/grocery/create',
        page: () => const AddGroceryScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/admin/grocery/edit',
        page: () => const GroceryEditScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/admin/wallet',
        page: () => const WalletScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/admin/setting',
        page: () => const SettingScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/chat',
        page: () => const ChatScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/grocery',
        page: () => const GroceryScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/cart',
        page: () => const CartScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/orders',
        page: () => const OrderScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/widgets/buttons',
        page: () => const ButtonsScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/widgets/toast',
        page: () => const ToastMessageScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/widgets/modal',
        page: () => const ModalScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/widgets/tabs',
        page: () => const TabsScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/widgets/cards',
        page: () => const CardsScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/widgets/loader',
        page: () => const LoadersScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/widgets/dialog',
        page: () => const DialogsScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/widgets/carousel',
        page: () => const CarouselsScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/widgets/drag_n_drop',
        page: () => const DragNDropScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/widgets/notification',
        page: () => const NotificationScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/form/basic_input',
        page: () => const BasicInputScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/form/custom_option',
        page: () => const CustomOptionScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/form/editor',
        page: () => const EditorScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/form/file_upload',
        page: () => const FileUploadScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/form/slider',
        page: () => const SliderScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/form/validation',
        page: () => const ValidationScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/form/mask',
        page: () => const MaskScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/error/coming_soon',
        page: () => const ComingSoonScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/error/500',
        page: () => const Error500Screen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/error/404',
        page: () => const Error404Screen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/extra/time_line',
        page: () => const TimeLineScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/extra/pricing',
        page: () => const PricingScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/extra/faqs',
        page: () => const FaqsScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/other/basic_table',
        page: () => const BasicTableScreen(),
        middlewares: [AuthMiddleware()]),
  ];
  return routes
      .map((e) => GetPage(
          name: e.name,
          page: e.page,
          middlewares: e.middlewares,
          transition: Transition.noTransition))
      .toList();
}
