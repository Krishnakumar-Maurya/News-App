import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutternews/helper/data.dart';
import 'package:flutternews/helper/news.dart';
import 'package:flutternews/models/ArticleModel.dart';
import 'package:flutternews/models/categori_model.dart';
import 'package:flutternews/views/article_view.dart';
import 'package:flutternews/views/category_news.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   List<CategoryModel> categories = <CategoryModel>[];
//   List<ArticleModel> articles = <ArticleModel>[];
//   bool _loading = true;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     categories = getCategories();
//     getNews();
//   }

//   getNews() async {
//     News newsClass = News();
//     await newsClass.getNews();
//     articles = newsClass.news;
//     setState(() {
//       _loading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text("Flutter"),
//             Text(
//               "News",
//               style: TextStyle(color: Colors.orange),
//             ),
//           ],
//         ),
//         elevation: 0.0,
//       ),
//       body: _loading
//           ? Center(
//               child: Container(
//                 child: CircularProgressIndicator(),
//               ),
//             )
//           : SingleChildScrollView(
//             child: Container(
//                 child: Column(
//                   children: <Widget>[
//                     //Categories
//                     Container(
//                       height: 70,

//                       child: ListView.builder(
//                         itemCount: categories.length,
//                         shrinkWrap: true,
//                         scrollDirection: Axis.horizontal,
//                         itemBuilder: (context, index) => CategoryTile(
//                           imageUrl: categories[index].imageUrl,
//                           CategoryName: categories[index].CategoryName,
//                         ),
//                       ),
//                     ),
//                     //Blogs
//                     Container(
//                       padding: EdgeInsets.only(top: 16),
//                       child: ListView.builder(
//                         itemCount: articles.length,
//                         itemBuilder: (context, index) {
//                           return BlogTile(
//                             imageUrl: articles[index].urlToImage,
//                             title: articles[index].title,
//                             desc: articles[index].description,
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//           ),
//     );
//   }
// }

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = <CategoryModel>[];
  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  Future<void> getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    setState(() {
      articles = newsClass.news;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              "Flutter",
              style: TextStyle(color: Colors.blue),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.orange),
            ),
          ],
        ),
        elevation: 0.0,
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: <Widget>[
                // Categories
                Container(
                  height: 70,
                  child: ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => CategoryTile(
                      imageUrl: categories[index].imageUrl,
                      CategoryName: categories[index].CategoryName,
                    ),
                  ),
                ),
                // Blogs
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 16),
                    child: ListView.builder(
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        return BlogTile(
                          imageUrl: articles[index].urlToImage,
                          title: articles[index].title,
                          desc: articles[index].description,
                          url: articles[index].url,
                          // content:articles[index].content,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String imageUrl, CategoryName;
  CategoryTile({required this.imageUrl, required this.CategoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CategoryNews(category: CategoryName.toLowerCase())));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Text(
                CategoryName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String desc;
  final String url;
// const BlogTile({super.key, required this.imageUrl, required this.title, required this.desc});
  BlogTile({
    required this.imageUrl,
    required this.title,
    required this.desc,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => ArticleView(
      //                 BlogUrl: url,
      //               )));
      // },
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleView(BlogUrl: url),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl)),
            SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              desc,
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
