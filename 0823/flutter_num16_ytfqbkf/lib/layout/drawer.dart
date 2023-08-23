part of layout;

var drawer = (ctx) => Drawer(
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          ElevatedButton(
            child: Text("user"),
            onPressed: () {
              Navigator.of(ctx).pushNamed("/user");
            },
          )
        ],
      ),
    );
