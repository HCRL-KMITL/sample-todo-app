import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../components/home_title.dart';
import '../components/todo_card.dart';
import 'test.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _future = Supabase.instance.client.from('tasks').select();

  List data = [];
  bool isLoading = true;

  Future<void> loadTodo() async {
    final data = await _future;

    setState(() {
      this.data = data;
      isLoading = false;
    });
  }

  @override
  void initState() {
    loadTodo();
    super.initState();
  }

  void pushToNewTaskPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TestPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(color: Color(0xFF393433)),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: HomeTitle(),
              floating: true,
              scrolledUnderElevation: 0,
              backgroundColor: Colors.white,
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            SliverList.separated(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final todo = data[index];

                return TodoCard(title: todo['name']);
              },
              separatorBuilder: (context, index) => const Padding(
                padding: .symmetric(horizontal: 22),
                child: Divider(height: 0, thickness: 0.8),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pushToNewTaskPage,
        backgroundColor: const Color(0xFF393433),
        child: const Icon(Icons.add_rounded, color: Colors.white),
      ),
    );
  }
}
