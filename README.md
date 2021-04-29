# Vogel Davi Test

This project was made for the Vogel interview. In the sections below it will be shown how to execute the project and its respective code documentation .

![Flutter app](https://s3.gifyu.com/images/ezgif.com-gif-maker4cdbf6487ffce94d.gif)

## Setup

- Use the futter version 2.0.5 (stable). This is the last version when this project was made
- Create a .env file folowing .env-example available on root folder
- The CI / CD process is configured in the codemagic account provided and can be modified by it.

## Packages used

- **dio** Http library used for make requests.
- **keyboard_actions** Used for add options above keyboard to navigate between TextFields.
- **mobx, flutter_mobx** and dev dependency **mobx_codegen** This is a packages for use Mobx for State Manager. This choice was difficult, because flutter has so many great options for state management, but I particularly prefer bloc and mobx, but thinking about simplicity, mobx is more simple than other packages, so it i choose this library.
- **freezed_annotation, json_serializable** and dev dependency **freezed** This is a powerfull libs for create code like kotlin DataClass and Unios. I particularly like use more for DataClasses, because is very useful. and json_serializeble is used for create a serializer and deserializer os json.
- **cached_network_image** Is used for cache downloaded images for don't need download them all the times
- **email_validator** is useful for validating e-mail easy
- **auto_size_text** Used for resize texts when dont have available spaces to fit all text, you can do it with FittedBox, but in more complex scenarios it can be more simple
- **flutter_secure_storage** package used for store data in a secure storage, I didn't get to implement that part, but the lib is still added as a suggestion
- **local_auth** Lib used for authenticate using Fingerprint and FaceId
- **flutter_dotenv** used for read .env files
- dev dependency **pedantic** is a package with pre configured rules of linter
- dev dependency **flutter_launcher_icons** Is usefull for create Android and iOS icons. I need only add one image and this package create all icons with respective sizes for android and iOS
- dev dependency **build_runner** Is a most popular package for code generator

## Assets

assets folder is localized on project root folder, it structure is:

- **fonts** 
    - Montserrat (free alternative to Futura)
    - Nunito (free alternative to Proxima Nova)
- **images**
    - all original images (considering 1.0x)
    - 2.0x containing same images, but with higher resolutions, for devices with more resolution
    - 3.0x 2.0x containing same images, but with higher resolutions, for devices with more resolution
- **icon**
    - contains the app icon image used for package flutter_launcher_icons generate all icons

## Project Structure

### core folder
 contains files with definitions used throughout the project. Particularly, I prefer to define standards for as many things as possible, because this avoids mistakes when building layout elements and makes the layout cleaner too, and having values declared directly in the code makes visualization a little more difficult.

- **settings.dart** has settings used on project like api keys and api url
- **vogel_colors.dart** has all colors used on project
- **vogel_elevation.dart** has all box shadows used on project
- **vogel_radius.dart** has all radius values used on project
- **vogel_routes.dart** has all String routes names used on project
- **vogel_spacing.dart** has all spacing values used on project

### components
 contains common components used throughout the project. A component can have a style or behavior that differs depending on where is used, in this case, I define a variation to work with these differences, below has an example of a Button component. It's expecting a variation property, and button color is defined by this variation property. At this moment I have only one variation, but when will work on different parts i will have more variations to add

	enum  VogelButtonVariation { darkWeb }
	
	Map<VogelButtonVariation,  Color> variationValues = {
		VogelButtonVariation.darkWeb:  VogelColors.darkWebColor,
	};
	
	ElevatedButton(
		onPressed: onPressed,
		style:  ElevatedButton.styleFrom(primary: variationValues[variation]),
		child:  Text(label),
	),

### models
no secret here, only simple models using freezed and json_serializable package for generate code for DataClass and json serialization

### services
contains files to make http requests

### screens
here I have so many files, the main files are the screen files, but inside each folder, if the screen has any logic, I will have a controller file (using mobx package) for writing all logic separate from UI. And if this screen has specific components I create a components folder inside this screen folder to put all local components. In this way, all of the local logic and local components of this screen is nearby to it

### main file

This is the application entry point, here is located the MaterialApp, and all children material widgets will be extended this theme, for instance, I declared a scaffoldBackgroundColor as white, and on all pages, the scaffoldBackgroundColor will be white.
Here I define common font styles for use this styles on the whole project, and define routes too using onGenerateRoute for use CupertinoPageRoute for have Cupertino transitions, having option to swipe from left to right to back on the previous screen


## Usability features not mentioned above

- float buttons on all screens for buttons to be located in the same place independent of the content.
- on pages with form, if a touch on screen area, the TextField will lose the focus and keyboard will dismiss.
- when have a touchable area, use a generous touch area.
- use FittedBox to ensure the content will be displayed independent who small the smartphone resolution are, here is an example. On the left has an original image, and on the right, I duplicated the number of options on all rows. But FittedBox will reduce the size of the image and text for all content to be displayed.

| ![](https://s3.gifyu.com/images/Simulator-Screen-Shot---iPhone-8---2021-04-28-at-15.26.36.png)  | ![](https://s3.gifyu.com/images/Simulator-Screen-Shot---iPhone-8---2021-04-28-at-15.27.47.png) |
|--|--|
|  |  |

