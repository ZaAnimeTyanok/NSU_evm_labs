#include <opencv2/opencv.hpp>
#include <iostream>

int main() {

    cv::Mat myImage_orig;
    cv::Mat myImage;
    cv::namedWindow("lab5_evm");
    cv::VideoCapture cap(0);

    if (!cap.isOpened()) {
        std::cout << "No video stream detected" << std::endl;
        return -1;
    
    }

    cv::TickMeter tm_full, tm_enter, tm_morph, tm_show, tm_wait;
    int full_frame_count = 0;

    tm_full.start();
    
    while (true) {

        tm_enter.start();
        cap >> myImage_orig;


        if (myImage_orig.empty()) { break; }
        tm_enter.stop();

        tm_morph.start();
        cv::bitwise_not(myImage_orig, myImage);
        tm_morph.stop();

        tm_show.start();
        cv::imshow("evm_lab5", myImage);
        tm_show.stop();

        tm_wait.start();
        if (cv::waitKey(1) == 27) { break; }
        tm_wait.stop();

        full_frame_count++;

    }

    tm_full.stop();
    
    std::cout << "time working: " << tm_full.getTimeSec() << std::endl
        << "average fps: " << full_frame_count / tm_full.getTimeSec() << " fraps" << std::endl
        << "enter: " << (tm_enter.getTimeSec() / (tm_full.getTimeSec() - tm_wait.getTimeSec()) * 100) << "%" << " " << std::endl
        << "morph: " << (tm_morph.getTimeSec() / (tm_full.getTimeSec() - tm_wait.getTimeSec()) * 100) << "%" << " " << std::endl
        << "show: " << (tm_show.getTimeSec() / (tm_full.getTimeSec() - tm_wait.getTimeSec()) * 100) << "%" << " " << std::endl;

    cap.release();

    return 0;

}
