# PixShare

![Alt Text](./app/assets/images/ps-logo.png)

PixShare is a photo-sharing platform that allows users to upload, view, and share photos. It is built using Ruby on Rails.

## Minimum Viable Product (MVP)

1. **User Authentication:** Allow users to sign up, log in, and log out. - [x]

   - Gems: Devise for user authentication.

2. **Photo Upload:** Enable users to upload photos with appropriate metadata. - [x]

   - Gems: Active Storage for file uploads.

3. **Photo Display:** Display photos uploaded by users on the platform. - [x]

4. **Collections:** Allow users to create collections or albums and organize their photos into them.
   - Gems: ActsAsTaggableOn for creating collections or albums.

## First Iteration

5. **User Profile:** Allow users to have their profiles with basic information and a list of their uploaded photos.

   - Gems: Simple_form for form generation.

6. **Commenting:** Enable users to comment on photos.

   - Gems: ActsAsCommentable for adding comments to models.

7. **Basic Search:** Implement a basic search functionality to find photos based on their titles or tags.

   - Gems: Ransack for simple search functionality.

8. **User Follows:** Allow users to follow other users and see their recent uploads.
   - Gems: ActsAsFollower for implementing the following feature.

## Second Iteration

1. **Advanced Search:** Implement more advanced search options, including filtering by date, location, and other metadata.

   - Gems: Elasticsearch for more complex search functionality.

2. **Geotagging:** Enable users to add geotags to their photos to show the location where the photo was taken.

   - Gems: Geocoder for geolocation functionalities.

3. **Notifications:** Implement a notification system to inform users about comments, likes, and new followers.
   - Gems: PublicActivity for building a notification system.
4. **Photo Editing:** Implement basic photo editing capabilities, such as cropping, filters, and basic adjustments.
   - Gems: MiniMagick for image manipulation.

## Installation

Requires ruby-3.2.2
If not installed do: 'rvm install "ruby-3.2.2"'

_Note: Always check for any updates or changes in the Rails documentation._
