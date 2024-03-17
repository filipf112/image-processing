function refined_corners = refine_corners(peaks, center_x, center_y)
    % Filter based on distance from center
    refined_corners = [];
    threshold = 10; % Adjust as needed
    for i = 1:length(peaks)
        distance_from_center = sqrt((peaks(i) - center_x)^2 + (peaks(i) - center_y)^2);
        if distance_from_center < threshold
            refined_corners = [refined_corners; peaks(i, :)];
        end
    end