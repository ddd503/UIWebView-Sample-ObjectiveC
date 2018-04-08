//
//  WebPageController.m
//  UIWebView-Sample-ObjectiveC
//
//  Created by kawaharadai on 2018/04/07.
//  Copyright © 2018年 kawaharadai. All rights reserved.
//

#import "WebPageController.h"

@interface WebPageController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

static NSString *const RequestURL = @"https://www.apple.com/";

@implementation WebPageController

#pragma mark - LifeCycle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

#pragma mark - Private Methods
- (void)setup {
    [self setupWebView];
    [self setURL: RequestURL];
}

- (void)setupWebView {
    self.webView.delegate = self;
    self.webView.scalesPageToFit = YES;
}

- (void)setURL:(NSString *)requestURLString {
    NSURL *url = [[NSURL alloc] initWithString: requestURLString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL: url
                                                  cachePolicy: NSURLRequestUseProtocolCachePolicy
                                              timeoutInterval: 5];
    [self.webView loadRequest: request];
}

#pragma mark - Action Methods
// 戻る
- (IBAction)back:(id)sender {
    if ([self.webView canGoBack]) {
        [self.webView goBack];
    }
}

// 進む
- (IBAction)forword:(id)sender {
    if ([self.webView canGoForward]) {
        [self.webView goForward];
    }
}

// 更新
- (IBAction)refresh:(id)sender {
    [self.webView reload];
}

#pragma mark - UIWebViewDelegate Methods
// ロード開始
- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"ロード開始");
}

// ロード完了
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"ロード完了");
}

// ロード失敗
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"ロード失敗、原因：%@", error.localizedDescription);
}

// ロード許可
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSLog(@"アクセスURL：%@", request.URL.absoluteString);
    
    return YES;
}
@end
