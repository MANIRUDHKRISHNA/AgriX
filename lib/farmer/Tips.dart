import 'package:flutter/material.dart';

class TipsScreen extends StatelessWidget {
  final List<TipCategory> tipCategories = [
    TipCategory(
      title: "Tropical Climate",
      tips: [
        TipItem(
          title: "Best Crops to Grow",
          content:
          "In tropical climates, crops like sugarcane, bananas, coffee, rice, and coconuts thrive. These crops require high humidity, consistent rainfall, and warm temperatures.",
        ),
        TipItem(
          title: "Selling Price Range",
          content:
          "Bananas: ₹20 - ₹40 per kg, Coffee: ₹500 - ₹800 per kg, Rice: ₹25 - ₹50 per kg, Coconuts: ₹15 - ₹25 per piece",
        ),
        TipItem(
          title: "Farming Tips",
          content:
          "Ensure proper irrigation for crops like rice. Maintain spacing for banana plants and prune regularly to boost yield. Coconuts need deep, well-drained soil for better growth.",
        ),
      ],
    ),
    TipCategory(
      title: "Temperate Climate",
      tips: [
        TipItem(
          title: "Best Crops to Grow",
          content:
          "Wheat, corn, barley, oats, and soybeans grow well in temperate climates. These crops benefit from moderate rainfall and cooler temperatures with defined seasons.",
        ),
        TipItem(
          title: "Selling Price Range",
          content:
          "Wheat: ₹15 - ₹30 per kg, Corn: ₹12 - ₹25 per kg, Soybeans: ₹40 - ₹60 per kg, Barley: ₹25 - ₹40 per kg",
        ),
        TipItem(
          title: "Farming Tips",
          content:
          "Plant wheat and barley during the cooler months. Ensure good soil preparation and apply fertilizers rich in nitrogen. Rotate crops to maintain soil health and prevent pests.",
        ),
      ],
    ),
    TipCategory(
      title: "Arid Climate",
      tips: [
        TipItem(
          title: "Best Crops to Grow",
          content:
          "Crops like millet, sorghum, dates, and guava are ideal for arid climates. These crops are drought-resistant and can thrive in regions with limited water availability.",
        ),
        TipItem(
          title: "Selling Price Range",
          content:
          "Dates: ₹300 - ₹500 per kg, Millet: ₹20 - ₹40 per kg, Sorghum: ₹18 - ₹35 per kg, Guava: ₹30 - ₹60 per kg",
        ),
        TipItem(
          title: "Farming Tips",
          content:
          "Utilize drip irrigation systems for efficient water use. Mulch your soil to retain moisture and prevent evaporation. Dates require well-drained sandy soils.",
        ),
      ],
    ),
    TipCategory(
      title: "Cold Climate",
      tips: [
        TipItem(
          title: "Best Crops to Grow",
          content:
          "Potatoes, carrots, apples, and broccoli are best suited for cold climates. These crops are frost-resistant and can withstand low temperatures.",
        ),
        TipItem(
          title: "Selling Price Range",
          content:
          "Potatoes: ₹20 - ₹35 per kg, Carrots: ₹25 - ₹40 per kg, Apples: ₹100 - ₹200 per kg, Broccoli: ₹50 - ₹80 per kg",
        ),
        TipItem(
          title: "Farming Tips",
          content:
          "Use frost covers to protect young plants. Plant cold-resistant varieties and ensure that the soil is well-drained to prevent waterlogging. Apples require pruning for better yield.",
        ),
      ],
    ),
    TipCategory(
      title: "Subtropical Climate",
      tips: [
        TipItem(
          title: "Best Crops to Grow",
          content:
          "Oranges, grapes, tea, and cotton are well-suited to subtropical climates. These crops thrive with seasonal rainfall and mild winters.",
        ),
        TipItem(
          title: "Selling Price Range",
          content:
          "Oranges: ₹40 - ₹70 per kg, Grapes: ₹50 - ₹90 per kg, Tea: ₹200 - ₹400 per kg, Cotton: ₹40 - ₹70 per kg",
        ),
        TipItem(
          title: "Farming Tips",
          content:
          "Maintain regular pruning for grapes and oranges to increase productivity. Tea requires shaded areas and frequent plucking for higher quality leaves. Cotton requires deep tillage and early planting.",
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farming Tips'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: tipCategories.length,
          itemBuilder: (context, index) {
            return TipCategoryWidget(category: tipCategories[index]);
          },
        ),
      ),
    );
  }
}

class TipCategory {
  final String title;
  final List<TipItem> tips;

  TipCategory({required this.title, required this.tips});
}

class TipItem {
  final String title;
  final String content;

  TipItem({required this.title, required this.content});
}

class TipCategoryWidget extends StatelessWidget {
  final TipCategory category;

  TipCategoryWidget({required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ExpansionTile(
        title: Text(
          category.title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        children: category.tips.map((tip) {
          return ListTile(
            title: Text(
              tip.title,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(tip.content),
          );
        }).toList(),
      ),
    );
  }
}
