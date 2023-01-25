find = input("Enter your choice\n1.Area\n2.Volume");
switch find
    case 1
        area = input("Enter your choice\n1.Circle\n2.Triangle");
        switch area
            case 1
                rad = input("Enter the radius of the circle:");
                fprintf("Area of Circle = %d",pi*r*r);
            case 2
                len = input("Enter the length of the traingle:");
                bre = input("\nEnter the breadth if the triangle:");
                fprintf("\nArea of the triangle = %d",(len*bre)/2);
            otherwise
                fprintf("Illegal object!")
        end
    case 2
        volume = input("Enter your choice\n1.Cone\n2.Cylinder");
        switch volume
            case 1
                r = input("Enter the radius of the cone: ");
                h = input("Enter the height of the cone: ");
                fprintf("Volume of cone = %d",(pi*r*r*h)/3);
            case 2
                r = input("Enter the radius of the cylinder: ");
                h = input("Enter the height of the cylinder: ");
                fprintf("Volume of cone = %d",pi*r*r*h);
            otherwise
                fprintf("Illegal object!");
        end
    otherwise
        fprintf("Illegal object!");
end






