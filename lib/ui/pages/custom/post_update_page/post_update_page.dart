import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/icon.dart';
import 'package:flutter_blog/ui/pages/custom/post_update_page/widgets/post_update_body.dart';

class PostUpdatePage extends StatelessWidget {
  const PostUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){},
          icon: iconArrowBack(),
        ),
      ),
      body: PostUpdateBody(),
    );
  }
}
