//
//  RecipeBuilder.swift
//  RecipeViewer
//
//  Created by Piotr Torczynski on 01/10/2024.
//

@testable import RecipeViewer

extension Recipe {
    static func make(
        label: String = "Beef Gulasch",
        image: String = "https://edamam-product-images.s3.amazonaws.com/web-img/0cb/0cb1a8874b5621ba18ef58eca82a63f5.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEoaCXVzLWVhc3QtMSJIMEYCIQDYukDxDKko0k%2Fnw3xphd1cDIRplmKaGWQpMPo2SU94%2BAIhAPggC66qUL0b%2B3O9kE0oldnhu4COVeJbUJfUbSGmeoHDKsIFCJL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMMTg3MDE3MTUwOTg2IgzCGENU0oef%2FcN5M28qlgWerYc4EpS%2B%2B7BOeX9sC4AgxNw9XbNpvFyJQJNQgC5AEGeV%2Fap8ZkTIAdMDae%2FpUSUAvSi5ESJBQqHyHqTnYW3dkCAUdtPv%2B%2BeWGzCm1D0W63aSptxDcYqHQIZcdVG8Pwdr4g3kQTsZMyKY2omeYYmFzKLFbN2NcNS6qxyqBJOog%2FesuTEittDv2geV2osYtSVDIssekyXZRxmPxYX4OUzhrM5C8SRjdC%2Fv6MsGwIC8wrgbo2y6lvjqHd1WUSg%2B84N1jyWz4WxYnTohJ%2BfRE%2F8t59tfIQTp4sl9XQQPj%2BorogfL05BkBH2PjBY9jN7lMyGDjL5zbiSqjnSpFixX%2Fy%2FJMTFJzpqOSzopp9bVDLaZbbb7qWZbgfieWkjX%2B3nEdji8q%2F6wvE%2B4s7pxUmNlQlcYxwi3ie%2FRLYl8w29RIXlIwjYtMxf%2BVej32SqXzlSE8BfC9iMRcNYyda%2FhY5r6bYsbZjQqBiyBcs3Z8LEb1isFuii9oweAPBVJcAgmgczYpyqrjQEH4rQdmlTs91dtAulk%2Be8q6mTkMTCuEft60BqxCPALnzvcb1Egzv2DMB9TCleIRjBWdsDZ%2BjGuiDIQcZo90NRJjlHCd6Izjh%2FfwcVn6FPPoRtj5vB0QBgYoHaa9hreHR6YoYLU9Jip%2FhBoswMBfcDZu4jHxvoVmJr3x6d%2Bap61d8bFX8IeWewpBjJgv2UFDUrFA%2BIRpxibfP8U62HC0Zvhkc8U2LZ8M2VxtCmiDixSK2PIFD2a7BaZnoNvplT0%2BZwrrHbsKYYn8NWNlMdLhoyKLBfcWeUUVXES3V6usjbJzxI7PUEoYaZZNXs6o%2FiutDnlwGpSK2jeL7w%2BOm14uM%2BAKN48INvZI%2BP6TeXUa88Wv4rlhDCI3vC3BjqwAT%2Firce9utDLMRKeNBeaVa1rlNzv700sEF%2B9LKq%2FA%2FdJktSbLSlvJRzXTH5XAOWoPzjYV%2BFJca%2Ba1TCduQgQNLARY%2FaGA69d5GJU31epylxVlPYwKpf84M%2F4eut3%2Fi71G2LejSRtAZshv1TXDfQutQJ%2BjL6vGTJ%2BLQsB2ctCSd6%2BotWNBTR10ZazXHcK7yG9D8NgbkvatoUmc4Y%2F%2FlMi9iPDtSZSZjftpgOkC11%2B%2BACh&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20241001T175848Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFJMOU3NZQ%2F20241001%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=bac5e0568e49a0fcab2a7dbf81ae3002b3e4b8c4ab744fd2442564f6e1e01ca2",
        url: String = "https://www.bonappetit.com/recipe/beef-gulasch",
        ingredients: [Ingredient] = [.make()],
        calories: Double = 5665.5571580000005,
        totalTime: Double? = 0,
        cuisineType: [String]? = ["italian"]
    ) -> Self {
        .init(label: label, image: image, url: url, ingredients: ingredients, calories: calories, totalTime: totalTime, cuisineType: cuisineType)
    }
}
