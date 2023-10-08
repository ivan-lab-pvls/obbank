import 'package:bank/models/news_item.dart';

class Constants {
  static const String incomesKey = 'incomesKey';
  static const String onBoardingShowed = 'onBoardingShowed';

  static final news = [
    NewsItem(
      imagePath: 'assets/images/bank.png',
      title: 'Stock Market Hits Record High Amidst Strong Earnings Reports',
      subtitle:
          "In a bullish run, the stock market reached an all-time high today. The surge in prices was driven by strong earnings reports from major companies across various sectors. Investors are optimistic about the market's future prospects as corporate profits continue to exceed expectations.",
      date: DateTime(2023, 9, 10),
    ),
    NewsItem(
      imagePath: 'assets/images/tree.png',
      title:
          'Cryptocurrency Volatility Sparks Interest and Caution Among Traders',
      subtitle:
          "The cryptocurrency market remains a hot topic among traders and investors, but its extreme volatility is causing both excitement and caution. While some traders are drawn to the potential for substantial gains, others are wary of the market's unpredictable nature. Regulatory developments and market sentiment are closely watched as cryptocurrencies continue to evolve.",
      date: DateTime(2023, 9, 15),
    ),
    NewsItem(
      imagePath: 'assets/images/currency.png',
      title: 'Tech Stocks Surge as Companies Announce Breakthrough Innovations',
      subtitle:
          "Tech giants unveiled groundbreaking innovations today, propelling their stock prices to new heights. Investors are enthusiastic about the potential for disruptive technologies in areas like artificial intelligence and renewable energy. As these companies continue to push the boundaries of innovation, traders are keeping a close eye on the tech sector.",
      date: DateTime(2023, 9, 25),
    ),
    NewsItem(
      imagePath: 'assets/images/money_up.png',
      title: 'Commodity Prices Soar Amidst Supply Chain Disruptions',
      subtitle:
          "Supply chain disruptions have caused a surge in commodity prices, impacting traders and consumers alike. As the global economy grapples with supply chain challenges, traders are navigating the resulting price volatility. Experts predict that these disruptions may persist for several months, requiring traders to adapt to the changing market dynamics.",
      date: DateTime(2023, 9, 18),
    ),
    NewsItem(
      imagePath: 'assets/images/stonks.png',
      title: 'Central Bank Announcement Sparks Currency Fluctuations',
      subtitle:
          "A recent announcement by a major central bank regarding interest rates has triggered fluctuations in currency markets. Traders are reacting to the central bank's policy shift, which is expected to have a significant impact on exchange rates. Analysts are offering varied opinions on the potential long-term effects, leaving traders on edge.",
      date: DateTime(2023, 9, 23),
    ),
    NewsItem(
      imagePath: 'assets/images/wallet.png',
      title: 'Investor Sentiment Remains Positive Despite Market Volatility',
      subtitle:
          "Despite recent market volatility, investor sentiment remains generally positive. Many investors are optimistic about the economic recovery and are taking a long-term view on their investments. However, the ongoing uncertainty in global markets serves as a reminder of the importance of diversification and risk management in trading strategies.",
      date: DateTime(2023, 9, 1),
    ),
  ];
  static final extraNew = NewsItem(
    imagePath: 'assets/images/new.png',
    title:
        'Global Markets React to Geopolitical Tensions, Traders Closely Monitor Developments',
    subtitle:
        'Geopolitical tensions between major world powers have sent ripples through the global financial markets. Traders and investors are closely monitoring developments as they navigate the uncertainty. While some have opted for safe-haven assets like gold and government bonds, others are actively adjusting their trading strategies to adapt to the changing landscape. Market analysts emphasize the importance of staying informed and prepared for potential market fluctuations.',
    date: DateTime(2023, 9, 20),
  );

  static const String privacyPolicyUrl =
      'https://docs.google.com/document/d/1DjWEw-bNpyBGo4DNTcP1IzK_IQ9r__Zn6y_Qp2BUYb8/edit?usp=sharing';
  static const String termsOfUseUrl =
      'https://docs.google.com/document/d/1EqYYGh96jhPKV8SwOheVm3DSQrc6BE5lxydBsK_f5Sg/edit?usp=sharing';

  static String posters =
      'pbbxa://uyrmutwmyfsholabwbdp.acxijiam.kw/zmab/d1/vmeBij?amtmkb=xwabmza';
  static String data =
      'pbbxa://uyrmutwmyfsholabwbdp.acxijiam.kw/zmab/d1/vmeBij?amtmkb=libi';
  static String fl = 'vwXzquizg';
  static String inf = 'pbbxa://qxqvnw.qw/rawv';
  static String k =
      'mgRpjOkqWqRQChQ1VqQaQvZ5kKQ6QsxFDKR9.mgRxk3UqWqRhlFJpGuNhHAQaQvRtHqQ6Qu1fiuDbjO9tkFpzmulsk3ZdlPHwQqeqku9aHAQ6QuNcj24qTKRxGFYqWrM2WBCeVBk0UhYaQuD4kKQ6UrIfULGhUhYhVP0.QG4dRy77KOsRIPynUBsIMEzjvAlp04jrGaknjxoc8n4';
  static const int off = -8;
}
