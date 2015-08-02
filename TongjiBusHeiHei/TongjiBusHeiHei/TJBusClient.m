//
//  TJBusClient.m
//  TongjiBusHeiHei
//
//  Created by Nathan on 8/2/15.
//  Copyright (c) 2015 TAC. All rights reserved.
//

#import "TJBusClient.h"
#import "AFNetworking.h"

#define BASE_URL @"http://202.120.165.1:8080/TJbus/"
#define GET_ROUTE           @"LoginServlet"
#define GET_TIMETABLE       @"GetBusServlet"


@implementation TJBusClient

+ (TJBusClient *)sharedClient{
    static TJBusClient *sharedClient = nil;
    static dispatch_once_t token;
    dispatch_once(&token,^{
        sharedClient = [[TJBusClient alloc]init];
    });
    
    return sharedClient;
}

- (void)GET:(NSString *)api
 parameters:(NSDictionary *)parameters
    success:(void (^)(AFHTTPRequestOperation *, id))success{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = [NSString stringWithFormat:@"%@%@",BASE_URL,api];
    
    [manager GET:url
      parameters:parameters
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             success(operation,responseObject);
    }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             success(operation,nil);
             NSLog(@"Error: %@", error);
    }];
}

- (void)getAllRouteWithID:(NSString *)idNumber
                 password:(NSString *)password
          andSuccessBlock:(void (^) (NSDictionary *)) block{
    [self GET:GET_ROUTE
   parameters:@{@"username" : idNumber,@"password" : password, @"weekend" : @0}
      success:^(AFHTTPRequestOperation *operation, id responseObject){
          NSDictionary *dic = responseObject;
          block(dic);
      }];
}

- (void)getTimeTableWithRouteId:(NSString *)idNumber
                andSuccessBlock:(void (^) (NSArray *)) block{
    [self GET:GET_TIMETABLE
   parameters:@{@"route_id" : idNumber}
      success:^(AFHTTPRequestOperation *operation, id responseObject){
          NSArray *array = responseObject;
          block(array);
      }];
}

@end
