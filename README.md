# Bitmap Editor

Ruby program that simulates bitmap editor. Bitmaps are represented as an M x N
matrix of pixels with each element representing a colour.

## Setup and Launch

Install all required gems first with command

    bundle install

After this step you can start program with command:

    ./editor.rb

    (or)

    ruby editor.rb

## Usage

Editor starts to simple prompt `> ` that indicates program is ready for your
input. Before you can use any other tools, you MUST create a new bitmap with `I`
tool.

### Tools

Below is listed all supported tools and their corresponding commands:

| Command     | Description |
| ----------- | ----------- |
| I M N       | Create a new M x N bitmap with all pixels coloured white (O) |
| C           | Clears the bitmap, setting all pixels to white (O) |
| L X Y C     | Colours the pixel (X,Y) with colour C. |
| V X Y1 Y2 C | Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive). |
| H X1 X2 Y C | Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive). |
| F X Y C     | Fill the region R with the colour C. R is defined as: Pixel (X,Y) belongs to R. Any other pixel which is the same colour as (X,Y) and shares a common side with any pixel in R also belongs to this region. |
| W F         | Scales bitmap with given factor (in percentage) |
| S           | Show the contents of the current image |
| X           | Terminate the session |
| ?           | Shows in program help |

### Added Feature

Added Feature from original specs is bitmap scaling. It uses simple
nearest-neighborhood algorithm to determine pixel colour.

## Example

    % ./editor.rb
    > I 3 3
    > L 2 2 A
    > H 1 3 1 W
    > H 1 3 3 Z
    > S
    WWW
    OAO
    ZZZ
    > W 200
    > S
    WWWWWW
    WWWWWW
    OOAAOO
    OOAAOO
    ZZZZZZ
    ZZZZZZ
    > W 50
    > S
    WWW
    OAO
    ZZZ
    > X
