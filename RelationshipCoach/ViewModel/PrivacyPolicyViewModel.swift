//
//  PrivacyPolicyViewModel.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 29/03/25.
//

import Foundation

class PrivacyPolicyViewModel: ObservableObject {
    @Published var termsAndConditions: [TermsAndCondition] = []
    
    init() {
        prepareData()
    }
    
    func prepareData() {
        termsAndConditions = [
            .init(
                section: "",
                items: [
                    "Relationship Coach Camille understands how important the privacy of personal information is to our users. We understand that your privacy matters and we respect your privacy choices."
                ]
            ),
            .init(
                section: "How we collect information:",
                items: [
                    "We collect information automatically and through the use of electronic tools that may be transparent to our visitors. For example, we may log the name of your Internet Service Provider or use cookie technology to recognize you and hold information from your visit. Among other things, the cookie may store you user name and password, sparing you from having to re-enter that information each then you visit, or may control the number of times you encounter a particular advertisement while visiting our site. As we adopt additional technology, we may also gather information through other means. In certain cases, you can choose not to provide us with information, for example by setting your browser to refuse to accept cookies, but if you do, you may be unable to access certain parts of the site or may be asked to re-enter your user name and password, and we may not be able to customize the site’s features according to your preferences.",
                    "We may use Personally Identifiable Information collected on RC to communicate directly with you about your registration and customization preferences; our Terms of Services and privacy policy; services and products offered by RC and other topics we think you might find of interest. Personally Identifiable Information collected by RC may also be used for other purposes, including but not limited to site administration, troubleshooting, processing of e-commerce transactions, administration of contests, an other communications with you. Certain third parties who provide technical support for our operations may access such information. We will use your information only as permitted by law. In addition, from time to tine as we continue to develop our business, we may sell, buy, merge or partner with other companies or businesses. In such transactions, user information may be among the transferred assets. We may also disclose your information in response to a court order at other times when we believe we are reasonably required to do so by law, in connection with the collection of amount you may owe to us, and/or to law enforcement authorities whenever we deem it appropriate or necessary. Please note we may not provide you with notice prior to disclosure in such cases.",
                    "RC expects affiliated sites, linked sites an its partners, advertisers and affiliates to respect the privacy of our users. Be aware, however, that third parties, including our partners, advertisers, affiliates and other content providers accessible through out site, may have their own privacy and data collection policies and practices. For example, during your visit to our App, you may link to, or view as part of a frame on RC, certain content that is actually created for hosted by a third party. Also, through RC you may be introduced to, or be able to access information, Websites, features, and contests offered by other parties. RC is not responsible for the action or policies of such third parties. You should check the application privacy policies of those third parties when providing information on a feature or page operated by a third party.",
                    "While on our App, our advertisers, promotional partners or other third parties may use cookies or other technology to attempt to identify some of your preferences or retrieve information about you. For example, some of our advertising is served by third parties and may include cookies that enable the advertiser to determine whether you have seen a particular advertisement before. Other features available on our site may offer services operated by third parties and may use cookies or other technology to gather information. RC does not control the use of this technology by third parties or the resulting information, and is not responsible for any action or policies of such third parties. You should also be aware that if you voluntarily disclose Personally Identifiable Information on message boards or in chat areas, that information can be viewed publicly and can be collected and used by third parties without our knowledge and may result in unsolicited messages from other individuals or third parties. Such activities are beyond the control of RC and this policy."
                ]
            ),
            .init(
                section: "Children:",
                items: [
                    "RC does not knowingly collect or solicit Personally Identifiable Information from or about children legally under age. If we discover we have received any information from a child under age in violation of this policy, we will delete that information immediately. If you believe RC has any information from or about anyone legally under age, please contact us at the address listed below."
                ]
            ),
            .init(
                section: "Contact us:",
                items: [
                    "Relationship Coach, LLC",
                    "34522 N. Scottsdale Road",
                    "Suite 120-181",
                    "Scottsdale, AZ",
                    "85266",
                    "camille@relationshipcoachllc.com"
                ]
            ),
            .init(
                section: "Changes to this Policy:",
                items: [
                    "RC reserves the right to change this policy at any time. Please check this page periodically for changes. Your continued use of our App following the posting of changes to these terms will mean you accept those changes."
                ]
            )
        ]
    }
}
