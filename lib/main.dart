import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
      routes: {
        '/userDetails': (context) => UserDetailsPage(),
        '/futsalDetails': (context) => FutsalDetailsPage(),
        '/advertisementDetails': (context) => AdvertisementDetailsPage(),
        '/newsDetails': (context) => NewsDetailsPage(),
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: GridView.count(
        crossAxisCount: 2, // Display 2 cards in a row
        padding: EdgeInsets.all(16.0),
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/userDetails');
            },
            child: Container(
              width: 150, // Set a width for the card, adjust as needed
              height: 150, // Set a height for the card, adjust as needed
              decoration: BoxDecoration(
                color: Colors
                    .white, // You can set the background color of the card here
                borderRadius: BorderRadius.circular(
                    10.0), // Adjust the border radius as needed
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.green, //
                    size: 50,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'User Management',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/futsalDetails');
            },
            child: Container(
              width: 150, // Set a width for the card, adjust as needed
              height: 150, // Set a height for the card, adjust as needed
              decoration: BoxDecoration(
                color: Colors
                    .white, // You can set the background color of the card here
                borderRadius: BorderRadius.circular(
                    10.0), // Adjust the border radius as needed
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.sports_soccer,
                    color: Colors.green, //
                    size: 50,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Venue Management',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/advertisementDetails');
            },
            child: HomeCard(
              icon: Icons.shopping_bag,
              title: 'Advertisement Card',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/newsDetails');
            },
            child: HomeCard(
              icon: Icons.article,
              title: 'News Card',
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/settings');
          }
        },
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  HomeCard({required this.icon, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}

class UserDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _showAddUserPopup() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Add User"),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: "Name"),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Username"),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Password"),
                    obscureText: true,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Confirm Password"),
                    obscureText: true,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Submit"),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          final username = 'User $index';
          final userDetails = 'Details of User $index';
          return UserCard(
            username: username,
            userDetails: userDetails,
            onEdit: () {},
            onDelete: () {},
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddUserPopup,
        child: Icon(Icons.add),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final String username;
  final String userDetails;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  UserCard({
    required this.username,
    required this.userDetails,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              username,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 2),
            Text(userDetails),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: onEdit,
                  child: Text(
                    'Edit',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                SizedBox(width: 8),
                TextButton(
                  onPressed: onDelete,
                  child: Text(
                    'Delete',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FutsalDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _showAddFutsalPopup() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Add Futsal"),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: "Futsal Name"),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Location"),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Description"),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Submit"),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Futsal Details'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          final futsalName = 'Futsal Venue $index';
          final futsalDetails = 'Details of Futsal Venue $index';
          return FutsalCard(
            futsalName: futsalName,
            futsalDetails: futsalDetails,
            onEdit: () {},
            onDelete: () {},
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddFutsalPopup,
        child: Icon(Icons.add),
      ),
    );
  }
}

class FutsalCard extends StatelessWidget {
  final String futsalName;
  final String futsalDetails;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  FutsalCard({
    required this.futsalName,
    required this.futsalDetails,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              futsalName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(futsalDetails),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: onEdit,
                  child: Text('Edit'),
                ),
                SizedBox(width: 8),
                TextButton(
                  onPressed: onDelete,
                  child: Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AdvertisementDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _showAddAdvertisementPopup() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Add Advertisement"),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: "Advertisement Title"),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Published Date"),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Description"),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Submit"),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Advertisement Details'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          final adTitle = 'Advertisement $index';
          final adDetails = 'Details of Advertisement $index';
          return AdCard(
            adTitle: adTitle,
            adDetails: adDetails,
            onEdit: () {},
            onDelete: () {},
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddAdvertisementPopup,
        child: Icon(Icons.add),
      ),
    );
  }
}

class AdCard extends StatelessWidget {
  final String adTitle;
  final String adDetails;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  AdCard({
    required this.adTitle,
    required this.adDetails,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              adTitle,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(adDetails),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: onEdit,
                  child: Text('Edit'),
                ),
                SizedBox(width: 8),
                TextButton(
                  onPressed: onDelete,
                  child: Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NewsDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _showAddNewsPopup() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Add News"),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: "News Title"),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Published Date"),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Location"),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Description"),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Submit"),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('News Details'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          final newsTitle = 'News $index';
          final newsDetails = 'Details of News $index';
          return NewsCard(
            newsTitle: newsTitle,
            newsDetails: newsDetails,
            onEdit: () {},
            onDelete: () {},
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddNewsPopup,
        child: Icon(Icons.add),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String newsTitle;
  final String newsDetails;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  NewsCard({
    required this.newsTitle,
    required this.newsDetails,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              newsTitle,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(newsDetails),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: onEdit,
                  child: Text('Edit'),
                ),
                SizedBox(width: 8),
                TextButton(
                  onPressed: onDelete,
                  child: Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Shastika Regmi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.email),
                SizedBox(width: 10),
                Text('example@example.com'),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone),
                SizedBox(width: 10),
                Text('9876543210'),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              child: Text('Edit Profile'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  OptionCard(
                    icon: Icons.vpn_key,
                    title: 'Change Password',
                    onTap: () {},
                  ),
                  OptionCard(
                    icon: Icons.delete,
                    title: 'Delete Account',
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Delete Account'),
                            content: Text(
                                'Are you sure you want to delete this account?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Submit',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  OptionCard(
                    icon: Icons.logout,
                    title: 'Logout',
                    onTap: () {
                      // Handle Logout option
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}

class OptionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  OptionCard({required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}
