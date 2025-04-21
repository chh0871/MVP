import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cherry_mvp/features/home/home_viewmodel.dart';
import 'package:cherry_mvp/features/home/widgets/product_card.dart'; // make sure ProductCard is here
import 'package:cherry_mvp/features/home/widgets/category.dart';
import 'package:cherry_mvp/features/home/widgets/chat_page.dart';
import 'package:cherry_mvp/core/router/nav_routes.dart'; // for AppRoutes.chat
import 'package:cherry_mvp/features/home/widgets/my_cart_page.dart'; // ✅ Cart page

class DashboardPage extends StatelessWidget {
  void _showChatModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => FractionallySizedBox(
        heightFactor: 0.95,
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          child: ChatPage(showAppBar: false),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        actions: [
          // 🛒 Cart Icon with static badge
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const MyCartPage()),
                  );
                },
              ),
              Positioned(
                right: 6,
                top: 6,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '2', // Static item count
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),

          // 💬 Fullscreen Chat
          IconButton(
            icon: Icon(Icons.chat_bubble_outline),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.chat),
          ),
        ],
      ),
      body: Consumer<HomeViewModel>(
        builder: (context, viewModel, _) {
          final products = viewModel.fetchProducts();
          final categories = viewModel.fetchCategories();

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🛍 Products
                  if (products.isNotEmpty) ...[
                    Text(
                      "Just For You",
                      style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    ListView.builder(
                      itemCount: products.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ProductCard(product: products[index]);
                      },
                    ),
                    SizedBox(height: 30),
                  ],

                  // 🗂 Categories
                  if (categories.isNotEmpty) ...[
                    Text(
                      "Categories",
                      style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return SingleCategory(category: categories[index]);
                      },
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.chat_bubble_outline),
                onPressed: () => _showChatModal(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}