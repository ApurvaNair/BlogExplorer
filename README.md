Blog Explorer
Blog Explorer is a Flutter application that allows users to browse and explore a list of blogs fetched from a RESTful API. The app is designed with a clean and responsive UI, including a splash screen, dark mode support, and the ability to mark blogs as favorites. The application is built using the BLoC architecture to manage state effectively and ensure a scalable and maintainable codebase. Bloc provides a structured way to handle multiple UI states such as loading, loaded, error, and search.

Features

Blog List View: Browse a list of blogs with titles and images.
Search Functionality: Easily search for blogs by title.
Detailed Blog View: Tap on any blog to see it on a separate screen.
Dark Mode Support: Toggle between light and dark themes on an icon click.
Error Handling: User-friendly error messages and retry options for failed data fetches.
Scroll to Top: Quickly return to the top of the blog list using a floating action button.
Project Structure

The Blog Explorer project structure is organized into different folders to maintain a clean and modular codebase. Inside lib/ folder, there are four folders and main.dart 
main.dart: The entry point of the application.

1)bloc/ - Contains the BLoC (Business Logic Component) classes to manage the state of the app. 
2)data/ : Contains the data layer of the app, including classes responsible for fetching data, and handling data sources.
3)models/: Contains the Blog model class that represents the data structure of a blog.
4)screens/: Contains the UI screens for the app.
