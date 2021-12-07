function colour = select_color(scheme, iter)

switch scheme
    case 1
        colour = parula(iter);

    case 2
        colour = turbo(iter);

    case 3
        colour = hsv(iter);

    case 4
        colour = hot(iter);

    case 5
        colour = cool(iter);

    case 6
        colour = spring(iter);

    case 7
        colour = summer(iter);

    case 8
        colour = autumn(iter);

    case 9
        colour = winter(iter);

    case 10
        colour = gray(iter);

    case 11
        colour = bone(iter);

    case 12
        colour = copper(iter);

    case 13
        colour = pink(iter);

    case 14
        colour = jet(iter);

    case 15
        colour = lines(iter);

    case 16
        colour = colorcube(iter);

    case 17
        colour = prism(iter);

    case 18
        colour = flag(iter);

    case 19
        colour = white(iter);

    otherwise
        colour = parula(iter);
end




