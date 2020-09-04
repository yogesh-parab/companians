import 'package:Final/Pages/Adopt.dart';
import 'package:Final/Pages/Breeds.dart';
import 'package:Final/Pages/Donate.dart';
import 'package:Final/Pages/Rescuers.dart';
import 'package:Final/Pages/Shop.dart';
import 'package:Final/Pages/about_us.dart';
import 'package:Final/Pages/homepage.dart';
import 'package:Final/Pages/Help.dart';


import 'package:bloc/bloc.dart';

enum NavigationEvents {
  AboutUsClickedEvent,
  AdoptClickedEvent,
  BreedsClickedEvent,
  DonateClickedEvent,
  HelpClickedEvent,
  RescuersClickedEvent,
  ShopClickedEvent,
  HomePageClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  
  NavigationStates get initialState => HomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.AboutUsClickedEvent:
        yield AboutUs();
        break;
      case NavigationEvents.AdoptClickedEvent:
        yield Adopt();
        break;
      case NavigationEvents.BreedsClickedEvent:
        yield Breeds();
        break;
      case NavigationEvents.DonateClickedEvent:
        yield Donate();
        break;
      case NavigationEvents.HelpClickedEvent:
        yield Help();
        break;
      case NavigationEvents.RescuersClickedEvent:
        yield Rescuers();
        break;
      case NavigationEvents.ShopClickedEvent:
        yield Shop();
        break;
    }

  }

  
}
