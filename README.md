<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Timesheet Application - Basic Version</title>
</head>
<body>

    <h1>Timesheet Application - Basic Version</h1>

    <h2>Introduction</h2>
    <p>The Timesheet Application is a Flutter-based mobile app designed to manage and track time across projects and tasks. The app allows users to authenticate, view a list of assigned projects, and see the tasks associated with each project. It integrates with an API for user authentication and task management. Additionally, Google Maps is used to provide location-based features, and state management is handled using the Provider package.</p>

    <h2>Features</h2>
    <ul>
        <li>User Login: Authenticate the user through the provided API.</li>
        <li>Project List: Fetch and display a list of assigned projects.</li>
        <li>Task List: Fetch and display a list of tasks for a selected project.</li>
        <li>Google Maps Integration: Display relevant location-based data.</li>
        <li>State Management: Uses the Provider package to manage application state.</li>
    </ul>

    <h2>Technologies Used</h2>
    <ul>
        <li>Flutter</li>
        <li>Dart</li>
        <li>API Integration: Fetch data from <a href="https://api.brandexperts.ae/api/register/">https://api.brandexperts.ae/api/register/</a>.</li>
        <li>Google Maps</li>
        <li>Provider (State Management)</li>
        <li>HTTP for network requests</li>
    </ul>

    <h2>Installation</h2>
    <h3>Prerequisites</h3>
    <ul>
        <li>Install Flutter from <a href="https://flutter.dev/docs/get-started/install">flutter.dev</a>.</li>
        <li>Install Dart SDK (comes with Flutter).</li>
        <li>Android Studio or Visual Studio Code with Flutter and Dart extensions.</li>
        <li>A physical or virtual device to run the application.</li>
    </ul>

    <h3>Steps to Run the App</h3>
    <ol>
        <li>Clone the repository:</li>
        <pre><code>git clone https://github.com/your-username/timesheet-app.git
cd timesheet-app</code></pre>
        <li>Install dependencies:</li>
        <pre><code>flutter pub get</code></pre>
        <li>Configure API: Make sure to configure the API base URL and endpoint properly in your app.</li>
        <li>Run the App:</li>
        <pre><code>flutter run</code></pre>
    </ol>

    <h2>API Integration</h2>
    <h3>User Login</h3>
    <p>The app uses the following API for user authentication:</p>
    <ul>
        <li>Endpoint: <code>https://api.brandexperts.ae/api/register/</code></li>
        <li>Method: POST</li>
        <li>Parameters: Username, Password (check the API documentation for more details).</li>
    </ul>

    <h3>Project List</h3>
    <p>Once logged in, the app fetches a list of assigned projects for the user via the API. The projects are displayed in a list format.</p>
    <ul>
        <li>Endpoint: <code>https://api.brandexperts.ae/api/projects/</code></li>
        <li>Method: GET</li>
    </ul>

    <h3>Task List</h3>
    <p>After selecting a project, the user can view a list of tasks related to that project.</p>
    <ul>
        <li>Endpoint: <code>https://api.brandexperts.ae/api/tasks/</code></li>
        <li>Method: GET</li>
    </ul>

    <h2>Google Maps Integration</h2>
    <p>Google Maps is used to display relevant location information in the app. The map shows the location of the tasks or projects based on the data from the API. Make sure to configure your Google Maps API key in the app for it to function correctly.</p>
    <ul>
        <li><a href="https://developers.google.com/maps/documentation/android-sdk/get-api-key">Get your Google Maps API Key</a></li>
    </ul>

    <h3>Adding the API Key to Your App</h3>
    <p>1. Open the <code>android/app/src/main/AndroidManifest.xml</code> file.</p>
    <p>2. Add your Google Maps API key inside the <code>&lt;application&gt;</code> tag:</p>
    <pre><code>&lt;meta-data
       android:name="com.google.android.geo.API_KEY"
       android:value="YOUR_GOOGLE_MAPS_API_KEY"/&gt;</code></pre>

    <h2>State Management with Provider</h2>
    <p>This app uses the <strong>Provider</strong> package for state management. The state is separated into models for the user, projects, and tasks. The data is fetched asynchronously and updated in the UI using the <code>ChangeNotifierProvider</code>.</p>
    <ul>
        <li><strong>User State:</strong> Tracks the current login state.</li>
        <li><strong>Project State:</strong> Manages the list of projects fetched from the API.</li>
        <li><strong>Task State:</strong> Manages the tasks related to a selected project.</li>
    </ul>

    <h2>Contact</h2>
    <p>For any queries or suggestions, feel free to reach out to me:</p>
    <ul>
        <li>Email: <a href="mailto:your.email@example.com">your.email@example.com</a></li>
        <li>GitHub: <a href="https://github.com/your-username">https://github.com/your-username</a></li>
    </ul>

</body>
</html>
