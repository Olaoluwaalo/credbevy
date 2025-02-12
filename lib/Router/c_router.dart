import 'package:credbevy/features/home/presentation/screens/home.dart';
import 'package:credbevy/features/home/presentation/screens/receipt_screen.dart';
import 'package:credbevy/features/home/presentation/screens/send_money_screen.dart';
import 'package:go_router/go_router.dart';


class CRoute {
  static final GoRouter router = GoRouter(
    
    initialLocation: '/homeScreen',
  

    routes: [
      GoRoute(
        path: "/homeScreen",
        builder: (context, state) {
          return const Home();
        },
      ),
      GoRoute(
        path: "/sendMoneyScreen",
        builder: (context, state) {
          return const SendMoneyScreen();
        },
      ),
      GoRoute( path: '/receiptScreen/:amount/:ref/:beneficiary', 
      builder: (context, state) {
      
        final amount = state.pathParameters['amount']!; 
        final ref = state.pathParameters['ref']!;
                final beneficiary = state.pathParameters['beneficiary']!;
        return ReceiptScreen(amount: amount, ref: ref, beneficiary:beneficiary,);
      },
      ),
      
    ],
  );
}
