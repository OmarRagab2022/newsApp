import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/modules/web_screen_view.dart';

Widget BulidArticlesItem(article, context) => InkWell(
      onTap: () {
        Navigato(context, WebScreenView(article['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: NetworkImage("${article['urlToImage']}"),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "${article['title']}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "${article['publishedAt']}",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget articaleBuildItem(list, context) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return BulidArticlesItem(list[index], context);
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: 10),
      fallback: (context) => Center(child: CircularProgressIndicator()),
    );

void Navigato(context, Widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));

Widget defaultfromfield(
        {@required TextEditingController controller,
        @required TextInputType type,
        Function onsubmit,
        Function onChange,
        @required Function validate,
        @required String label,
        @required IconData prefix,
        Function ontap,
        bool isClicked}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      enabled: isClicked,
      onFieldSubmitted: onsubmit,
      onChanged: onChange,
      validator: validate,
      onTap: ontap,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        border: OutlineInputBorder(),
      ),
    );
