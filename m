Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1D46E1236
	for <lists+linux-audit@lfdr.de>; Thu, 13 Apr 2023 18:25:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681403152;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=n97xOpnNwhzwDTmOln+xsrowGY4CmWD22kpgLUaDbv4=;
	b=MQnvYcAArZherhct/GISiDmdWcQo3Owa3g88XLtSvo7aNtOnH97Nt97l/6tE9rqTDEGjV2
	0zemBBr97lTRA2GWp9tmEnE/MB3IFMyG7/5auNlLakBy375nSA9aZkRKweT3Z4muA1lV6g
	OFknyrbLANUn7EKNpdhDFmm5wVOHuD8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-iwwxzvDkPt-e2UjgcwugBw-1; Thu, 13 Apr 2023 12:25:50 -0400
X-MC-Unique: iwwxzvDkPt-e2UjgcwugBw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0C65185A790;
	Thu, 13 Apr 2023 16:25:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6297A1121320;
	Thu, 13 Apr 2023 16:25:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 93DE41946A75;
	Thu, 13 Apr 2023 16:25:38 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0E15419465B6 for <linux-audit@listman.corp.redhat.com>;
 Thu, 13 Apr 2023 16:23:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AC6692027044; Thu, 13 Apr 2023 16:23:37 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A419E2027043
 for <linux-audit@redhat.com>; Thu, 13 Apr 2023 16:23:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 804CE3847080
 for <linux-audit@redhat.com>; Thu, 13 Apr 2023 16:23:37 +0000 (UTC)
Received: from DM5PR00CU002.outbound.protection.outlook.com
 (mail-centralusazon11021014.outbound.protection.outlook.com [52.101.62.14])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-113-pU37O5vLMLe7hPXuQiJVew-1; Thu, 13 Apr 2023 12:23:34 -0400
X-MC-Unique: pU37O5vLMLe7hPXuQiJVew-1
Received: from BN7PR21MB1635.namprd21.prod.outlook.com (2603:10b6:406:b1::31)
 by SJ0PR21MB2037.namprd21.prod.outlook.com (2603:10b6:a03:38c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.4; Thu, 13 Apr
 2023 16:23:31 +0000
Received: from BN7PR21MB1635.namprd21.prod.outlook.com
 ([fe80::6110:d973:9f80:b109]) by BN7PR21MB1635.namprd21.prod.outlook.com
 ([fe80::6110:d973:9f80:b109%7]) with mapi id 15.20.6319.006; Thu, 13 Apr 2023
 16:23:31 +0000
From: Carlos De Avillez <Carlos.DeAvillez@microsoft.com>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Subject: Re: small patch for issue with rules that have been (incorrecly)
 copied from Windows
Thread-Topic: small patch for issue with rules that have been (incorrecly)
 copied from Windows
Thread-Index: AQHZPaOfut61R/VCy0C+MqS6mxT7Rq8pzScX
Date: Thu, 13 Apr 2023 16:23:31 +0000
Message-ID: <BN7PR21MB1635C32B81A78262B147C1358F989@BN7PR21MB1635.namprd21.prod.outlook.com>
References: <BN7PR21MB163531AF592295002D4D37D98FDE9@BN7PR21MB1635.namprd21.prod.outlook.com>
In-Reply-To: <BN7PR21MB163531AF592295002D4D37D98FDE9@BN7PR21MB1635.namprd21.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2023-04-13T16:23:30.692Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR21MB1635:EE_|SJ0PR21MB2037:EE_
x-ms-office365-filtering-correlation-id: 47c91802-fe8b-446c-4d7b-08db3c3b6bca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: ZruK6sGFIh1tqQYQTYc33PmKSxC7jYckBBiK+DfkYg2+qzPJ+8K36UCLQ2XwYxsKVTSnzV2vG7T3crKnpqh5jv5QRCuxXARSrFEbLn1HMRWTffyEstcnNCyvceQY6Yz+QQHmkCJB58CZUF9ZuvAF8iHFqn6Ha1NFhwiy/RtoCpmyKGJfgroNkIUWo9blFdXqZOPiUslUesPPKX8Zf6gN3QVhZ5JBklEnha9dliAPl73l+uA0xt1ark8F62Gqxcf1IvriZ/PDaO4xqKydll6E9jVQrMttirewzlmGIoHuAxdLlEu7zFHS6lGgDvcfk//xm+qdoj1zlKgGlirbxgE51JwRhoRlCGGkRYP4/8SFEHXe7rZ+7ceI5Z9xthuIhLCi9+JEEnKNaes9UQeR5pr9X8MW3Dtu/3iDF5IKQSQxMobukv9SPJBCtLW/PGIdb1eOXEJ3TkMz1Gfr/ShXVww7Lizho41oenhqL2KA+SG3+Bfu6LcvX8jWWxdL8Yw/UhmItJGB59mBx09XQWAqEuWhM32IV9OLWCuu9xg8gpSwtptcFoV0Ck9QH/Yo9sWgm9JDMvVKlLgbdHOgxmCuELnoGNzH7vjGXKU4HKS+nYAJCOjtLVGycE7XBip7fDtSvD6mA4Gouc+DV7Vq2h09XKzMVUwKwWoPPeH+IAwCgqVEutSutwE0iFd4j7L5vXd9wXSF
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR21MB1635.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(376002)(346002)(136003)(39860400002)(451199021)(33656002)(52536014)(8936002)(5660300002)(166002)(122000001)(66899021)(8676002)(66476007)(66556008)(64756008)(66446008)(66946007)(82950400001)(82960400001)(38100700002)(41300700001)(8990500004)(55016003)(2906002)(6916009)(38070700005)(86362001)(966005)(53546011)(26005)(6506007)(9686003)(7696005)(71200400001)(19627405001)(83380400001)(186003)(316002)(76116006)(786003)(91956017)(10290500003)(478600001);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YLt5wkVJtfeEF+R+/KfyiQ7zi6esmphgiuKXMuOOZmfvandcZCDys8LBxjxo?=
 =?us-ascii?Q?+Y85XTRHg239hotUU6bM/QqNMlcQr3JsMkitbRwkSK7DjyNg4rsRdMp8x/U5?=
 =?us-ascii?Q?csUidfym7w866eedMN40E87bw+DJKzy5M7RnMP62nER3WgFggaPME2kXaGZP?=
 =?us-ascii?Q?5H3ZG9iD51rVflg9O0PwZ51S5EbcIw2TH4GZEdnMyettpyOhh+XkvI8ejiFY?=
 =?us-ascii?Q?In6EiKhlPyVzn4DMYrM6lC9a5ptFns4A3EUFLJKqlSBSwABDIdxqbi65X7FJ?=
 =?us-ascii?Q?xsnqiLKUgVUqRhsNBndSoeWHqnuzcxGKvSa9bQhqH9WdftLw4eEhwfe8947D?=
 =?us-ascii?Q?usd2mKK1rePgZRVi1qXjmc15XCgwiVSIsOriQYtD230ovjyM8tMEFoL+VMbA?=
 =?us-ascii?Q?5H1OmbDHEP23h2AHlpq9LEJKhLw9rthmScEOQKVbDiPARVnd0D/Pl0OaCAnM?=
 =?us-ascii?Q?UJj70//DZbG5nICYbdM8+1VzbNi0P4JbwNqC4Y1GjAeiLADFYs2tRneGl2SO?=
 =?us-ascii?Q?jQCwM0BLdqwuDhqHo6og4+BnL0bE+/zRRlQgJc1H5PVK+1+xpfVlhhAzyazx?=
 =?us-ascii?Q?F4mt9mKm6bmxnV1LdaN5585RQ9I0qZEd/qRVj5llqBYSvSR2hdzzvMyM1Q61?=
 =?us-ascii?Q?H6C6e8W0Vupjv/3elUJ05VUwbYFoUUqdw8TR/2/IChe2WZc6yhbRLV2HZbxo?=
 =?us-ascii?Q?wKAEK3pTMmqHG8R4IZDS0li6qilelyo4IaOCWzPfglCETk82kFtP07anlKq7?=
 =?us-ascii?Q?8jhLuwAhIDUaHbaxFtQ5NMG3IXxNgjEGzpN4ATjxrf1VL21xuigqfY0DJW35?=
 =?us-ascii?Q?zZ6c7pNohC5bgGUJ7Dp4JyOyOtJWA/9EGFa1qvt82Gy6msl8TASSW6jDNczJ?=
 =?us-ascii?Q?IML68B/87Kiw5fZqLIYl13+O+XOrjMUk4B5jnOLx4INs9rTLyGk0o4dDP6P3?=
 =?us-ascii?Q?68lQxidmQkXgN8r7VJt507GdF3RhD22aVRPH6+yap/rlIsGQpR5ljKHfUGXH?=
 =?us-ascii?Q?zeAqnI51BPOjaeAwRX5O27Aw+fxPLjvkzx4on3Rv7zHaVrC+t4co9epqoIVn?=
 =?us-ascii?Q?EZ3s6bnbfVJHafA3a5B9SU9fWFdFiv5Adiv3CmtgYbawy+Tv+oIDPRKz3vIa?=
 =?us-ascii?Q?ZCp0Nm43BZIJPsA2obJi0Wd4jMy2ubt7G3BBACONJs6sAtF9+3XgyUX4ARno?=
 =?us-ascii?Q?fDmNoNZXnTNy76K1vv5BwT5L+Y9jBbBQCJVC2oraOHThJt1UY+jn1eU/G0K9?=
 =?us-ascii?Q?cBR2xeAVWwXOZ3o1nBZIedGEHnPxfB4ArvhtNfzeD8GeXx87GUBqjoKmeTH7?=
 =?us-ascii?Q?tBB7RKPulGvKmc2VOapullM9dtfuNAdoTWVwGfUuOf71pBnzBmscgx1iuvBZ?=
 =?us-ascii?Q?ZbvujKWC/0DiDDOUTEppadafXtVyx204DGltIafE48Zcd2BX0hIe8xCMX3nr?=
 =?us-ascii?Q?CeMrxa3gn82hcp2LF6y3r94nfsQn8b6IfVHdtFTRVwhqPDgeAl7gK2d8UCwo?=
 =?us-ascii?Q?kgMIjPPdcyB1Yuv7T9PUWVNPQuoSEbyzgvkt7WUsseBQGXhIMCehtzzh42wM?=
 =?us-ascii?Q?LLMJjZTbzBbvZiwBdnHbfHi/RdAWrtIJ9RJEBRcQ?=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR21MB1635.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47c91802-fe8b-446c-4d7b-08db3c3b6bca
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2023 16:23:31.1797 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FU8gTPe4cu/IEwFU5YuAY9pRoQxTzJS2g7L6fbVsYHT2fzdXWYi3l5Eo10994mjHLy4nZhcaxFiZFWsdPqnJcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR21MB2037
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: microsoft.com
Content-Language: en-US
Content-Type: multipart/mixed; boundary="===============9155692944059736272=="

--===============9155692944059736272==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN7PR21MB1635C32B81A78262B147C1358F989BN7PR21MB1635namp_"

--_000_BN7PR21MB1635C32B81A78262B147C1358F989BN7PR21MB1635namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello again,

Just checking is there is interest in the below.

Cheers,


Carlos de Avillez

Senior Escalation Engineer
Microsoft Azure Technical Support
Customer Service and Support

Office: +1 (469) 7753777

cadeavil@microsoft.com<mailto:cadeavil@microsoft.com>

Working hours: 10:00-19:00 US Central Time

Next days off during August 2020:  3, 10, 17, 24, 31

If you need to work with another Support Engineer outside of my working hou=
rs, please send email to azurebu@microsoft.com<mailto:azurebu@microsoft.com=
> with your case number, and availability.

We are always interested to hear your feedback. Please feel free to reach m=
y manager regarding the level of service you have received -  spogge@micros=
oft.com<mailto:spogge@microsoft.com>
[X]
Microsoft Azure<https://azure.microsoft.com/en-us/> | Azure Status<https://=
status.azure.com/en-us/status> | Support Plans<https://azure.microsoft.com/=
en-us/support/plans/> | Create a Case<https://azure.microsoft.com/en-us/sup=
port/create-ticket/> | Privacy Policy<https://privacy.microsoft.com/en-us/P=
rivacyStatement>



________________________________
From: Linux-audit <linux-audit-bounces@redhat.com> on behalf of Carlos De A=
villez <Carlos.DeAvillez@microsoft.com>
Sent: Friday, February 10, 2023 17:37
To: linux-audit@redhat.com <linux-audit@redhat.com>
Subject: [EXTERNAL] small patch for issue with rules that have been (incorr=
ecly) copied from Windows

Hello,

We have had at least a few instances where customers configured audit rules=
 on Windows, and then incorrectly
moved the resulting '.rules' files to Linux.

These files still had the Windows  line terminator (CRLF). 'augenrules' rea=
d them without issues and generated the
/etc/audit/audit.rules file.

But on loading the new audit.rules, 'auditctl -R' will receive a bad return=
 code, and stop loading the rules. The
resulting error is a bit on the cryptic side, and our customers do not seem=
 to catch it easily.

The proposed fix is simple, and resolves the issue when using 'augenrules'.=
 Of course, if someone generates
/etc/audit/audit.rules directly, it could still fail, but I understand that=
 we are moving to using 'augenrules' by
default.

Patch (against current head) is below.

Cheers,

..Carlos..

From 4ccae6353500d3870d4da8905ed01d18d36b066a Mon Sep 17 00:00:00 2001
From: C de-Avillez <cadeavil@microsoft.com>
Date: Fri, 10 Feb 2023 17:16:09 -0600
Subject: [PATCH] augenrules: make sure no lines in *.rules ends in CRLF,
 otherwise 'auditctl -R' will then fail to fully load the rules.

---
 init.d/augenrules | 1 +
 1 file changed, 1 insertion(+)

diff --git a/init.d/augenrules b/init.d/augenrules
index edb2199..f74c6e2 100644
--- a/init.d/augenrules
+++ b/init.d/augenrules
@@ -84,6 +84,7 @@ BEGIN   {
         minus_b =3D "";
         rest =3D 0;
 } {
+        sub(/\r$/, "");
         if (length($0) < 1) { next; }
         if (match($0, "^\\s*#")) { next; }
         if (match($0, "^\\s*-e")) { minus_e =3D $0; next; }
--
2.34.1







Carlos
  de Avillez








Senior
  Escalation Engineer

  Microsoft Azure Technical Support

  Customer Service and Support






Office: +1 (469) 7753777


cadeavil@microsoft.com


Working
  hours: 10:00-19:00
  US Central Time


Next days off during August 2020:  3, 10, 17, 24, 31







If you need to work with another Support Engineer outside of my
working hours, please send email to azurebu@microsoft.com with
your case number, and availability.
We are always interested to hear your feedback. Please feel free
to reach my manager regarding the level of service you have received -  spo=
gge@microsoft.com

Microsoft
Azure | Azure
Status | Support
Plans | Create
a Case | Privacy
Policy



--
Linux-audit mailing list
Linux-audit@redhat.com
https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flistman=
.redhat.com%2Fmailman%2Flistinfo%2Flinux-audit&data=3D05%7C01%7Ccarlos.deav=
illez%40microsoft.com%7C0d78e8a8334d4fcc044e08db0d4b362c%7C72f988bf86f141af=
91ab2d7cd011db47%7C1%7C0%7C638118388923975931%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%=
7C&sdata=3DcKyVRKjwU5Rxd0xocsYa03Mjz39VYtmyWqsAjsgUipQ%3D&reserved=3D0<http=
s://listman.redhat.com/mailman/listinfo/linux-audit>


--_000_BN7PR21MB1635C32B81A78262B147C1358F989BN7PR21MB1635namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);">Hello again,</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);">Just checking is there is interest in the below.</s=
pan></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);">Cheers,</span></div>
<div class=3D"elementToProof">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);">
<table style=3D"border-collapse:collapse;mso-yfti-tbllook:1184;mso-padding-=
alt:0in 0in 0in 0in" class=3D"ContentPasted0">
<tbody class=3D"ContentPasted0">
<tr style=3D"mso-yfti-irow:0;mso-yfti-firstrow:yes" class=3D"ContentPasted0=
">
<td colspan=3D"3" style=3D"padding:0in 0in 0in 0in" class=3D"ContentPasted0=
">
<p style=3D"margin:0in;font-size:11pt;font-family:Calibri, sans-serif"><b><=
span style=3D"font-family:&quot;Segoe UI&quot;,sans-serif" class=3D"Content=
Pasted0">Carlos de Avillez</span></b><span style=3D"font-size: 8pt; font-fa=
mily: &quot;Segoe UI Semibold&quot;, sans-serif; color: black;"><o:p class=
=3D"ContentPasted0">&nbsp;</o:p></span></p>
</td>
</tr>
<tr style=3D"mso-yfti-irow:1;mso-yfti-lastrow:yes" class=3D"ContentPasted0"=
>
<td width=3D"170" valign=3D"top" style=3D"width:127.5pt;padding:0in 0in 0in=
 0in" class=3D"ContentPasted0">
<p style=3D"margin:0in;font-size:11pt;font-family:Calibri, sans-serif"><spa=
n style=3D"font-size: 8pt; font-family: &quot;Segoe UI&quot;, sans-serif; c=
olor: rgb(115, 115, 115);" class=3D"ContentPasted0">Senior Escalation Engin=
eer<br class=3D"ContentPasted0">
Microsoft Azure Technical Support<br class=3D"ContentPasted0">
Customer Service and Support<o:p class=3D"ContentPasted0">&nbsp;</o:p></spa=
n></p>
</td>
<td width=3D"250" valign=3D"top" style=3D"width:187.5pt;padding:0in 0in 0in=
 0in" class=3D"ContentPasted0">
<p style=3D"margin:0in;font-size:11pt;font-family:Calibri, sans-serif"><spa=
n style=3D"font-size: 8pt; font-family: &quot;Segoe UI&quot;, sans-serif; c=
olor: rgb(115, 115, 115);" class=3D"ContentPasted0">Office:
</span><span style=3D"font-size: 8pt; font-family: &quot;Segoe UI&quot;, sa=
ns-serif; color: rgb(115, 115, 115);" class=3D"ContentPasted0">+1 (469) 775=
3777</span><span style=3D"font-size: 8pt; font-family: &quot;Segoe UI&quot;=
, sans-serif; color: rgb(115, 115, 115);"><o:p class=3D"ContentPasted0">&nb=
sp;</o:p></span></p>
<p style=3D"margin:0in;font-size:11pt;font-family:Calibri, sans-serif"><a h=
ref=3D"mailto:cadeavil@microsoft.com" class=3D"ContentPasted0">cadeavil<spa=
n style=3D"font-size:8.0pt;font-family:&quot;Segoe UI&quot;,sans-serif">@mi=
crosoft.com</span></a><span style=3D"font-size: 8pt; font-family: &quot;Seg=
oe UI&quot;, sans-serif; color: rgb(115, 115, 115);"><o:p class=3D"ContentP=
asted0">&nbsp;</o:p></span></p>
<p style=3D"margin:0in;font-size:11pt;font-family:Calibri, sans-serif"><spa=
n style=3D"font-size: 8pt; font-family: &quot;Segoe UI&quot;, sans-serif; c=
olor: rgb(115, 115, 115);" class=3D"ContentPasted0">Working hours: 10</span=
><span style=3D"font-size:8.0pt;font-family:&quot;Segoe UI&quot;,sans-serif=
" class=3D"ContentPasted0">:00-19:00
 US Central Time<o:p class=3D"ContentPasted0">&nbsp;</o:p></span></p>
<p style=3D"margin:0in;font-size:11pt;font-family:Calibri, sans-serif"><spa=
n style=3D"font-size: 8pt; font-family: &quot;Segoe UI&quot;, sans-serif; c=
olor: rgb(115, 115, 115);" class=3D"ContentPasted0">Next days off during Au=
gust 2020:<span style=3D"mso-spacerun:yes" class=3D"ContentPasted0">&nbsp;
</span>3, 10, 17, 24, 31</span><span style=3D"font-size: 8pt; font-family: =
&quot;Segoe UI&quot;, sans-serif; color: rgb(115, 115, 115);"><o:p class=3D=
"ContentPasted0">&nbsp;</o:p></span></p>
</td>
<td width=3D"150" valign=3D"top" style=3D"width:112.5pt;padding:0in 0in 0in=
 0in" class=3D"ContentPasted0">
</td>
</tr>
</tbody>
</table>
<p style=3D"margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;=
 background: white;">
<i><span style=3D"font-size: 10pt; font-family: &quot;Segoe UI&quot;, sans-=
serif; color: rgb(82, 80, 81);" class=3D"ContentPasted0">If you need to wor=
k with another Support Engineer outside of my working hours, please send em=
ail to
</span></i><span style=3D"font-size: 10pt; font-family: &quot;Segoe UI&quot=
;, sans-serif; color: black;"><a href=3D"mailto:azurebu@microsoft.com" clas=
s=3D"ContentPasted0">azurebu@microsoft.com</a></span><i><span style=3D"font=
-size: 10pt; font-family: &quot;Segoe UI&quot;, sans-serif; color: rgb(82, =
80, 81);" class=3D"ContentPasted0">
 with your case number, and availability.</span></i><i><span style=3D"font-=
size: 10pt; font-family: &quot;Segoe UI&quot;, sans-serif; color: rgb(82, 8=
0, 81);"><o:p class=3D"ContentPasted0">&nbsp;</o:p></span></i></p>
<p style=3D"margin:0in;font-size:11pt;font-family:Calibri, sans-serif" clas=
s=3D"ContentPasted0">
<i><span style=3D"font-size: 10pt; font-family: &quot;Segoe UI&quot;, sans-=
serif; color: rgb(89, 89, 89);" class=3D"ContentPasted0">We are always inte=
rested to hear your feedback. Please feel free to reach my manager regardin=
g the level of service you have received</span></i><i><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Segoe UI&quot;,sans-serif" class=3D"ContentPas=
ted0">
 - </span></i><span style=3D"font-size:10.0pt"><span style=3D"mso-spacerun:=
yes" class=3D"ContentPasted0">&nbsp;</span></span><span style=3D"font-size:=
10.0pt;font-family:&quot;Segoe UI&quot;,sans-serif"><a href=3D"mailto:spogg=
e@microsoft.com" class=3D"ContentPasted0">spogge@microsoft.com</a></span><i=
><span style=3D"font-size: 8pt; font-family: &quot;Segoe UI&quot;, sans-ser=
if; color: rgb(82, 80, 81);"><br class=3D"ContentPasted0">
</span></i><img width=3D"159" height=3D"55" style=3D"height:.575in;width:1.=
654in" class=3D"ContentPasted0" src=3D"file:///C:/Users/cadeavil/AppData/Lo=
cal/Temp/msohtmlclip1/01/clip_image001.png"><i><span style=3D"font-size: 8p=
t; font-family: &quot;Segoe UI&quot;, sans-serif; color: rgb(82, 80, 81);">=
<br class=3D"ContentPasted0">
</span></i><a href=3D"https://azure.microsoft.com/en-us/" class=3D"ContentP=
asted0">Microsoft Azure</a> |
<a href=3D"https://status.azure.com/en-us/status" class=3D"ContentPasted0">=
Azure Status</a> |
<a href=3D"https://azure.microsoft.com/en-us/support/plans/" class=3D"Conte=
ntPasted0">
Support Plans</a> | <a href=3D"https://azure.microsoft.com/en-us/support/cr=
eate-ticket/" class=3D"ContentPasted0">
Create a Case</a> | <a href=3D"https://privacy.microsoft.com/en-us/PrivacyS=
tatement" class=3D"ContentPasted0">
Privacy Policy</a><span style=3D"mso-ascii-font-family:Calibri;mso-hansi-fo=
nt-family:Calibri;mso-bidi-font-family:Calibri"><o:p class=3D"ContentPasted=
0">&nbsp;</o:p></span></p>
<p style=3D"margin:0in;font-size:11pt;font-family:Calibri, sans-serif"><o:p=
 class=3D"ContentPasted0">&nbsp;</o:p></p>
<br>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Linux-audit &lt;linux=
-audit-bounces@redhat.com&gt; on behalf of Carlos De Avillez &lt;Carlos.DeA=
villez@microsoft.com&gt;<br>
<b>Sent:</b> Friday, February 10, 2023 17:37<br>
<b>To:</b> linux-audit@redhat.com &lt;linux-audit@redhat.com&gt;<br>
<b>Subject:</b> [EXTERNAL] small patch for issue with rules that have been =
(incorrecly) copied from Windows</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hello,<br>
<br>
We have had at least a few instances where customers configured audit rules=
 on Windows, and then incorrectly<br>
moved the resulting '.rules' files to Linux.<br>
<br>
These files still had the Windows&nbsp; line terminator (CRLF). 'augenrules=
' read them without issues and generated the<br>
/etc/audit/audit.rules file.<br>
<br>
But on loading the new audit.rules, 'auditctl -R' will receive a bad return=
 code, and stop loading the rules. The<br>
resulting error is a bit on the cryptic side, and our customers do not seem=
 to catch it easily.<br>
<br>
The proposed fix is simple, and resolves the issue when using 'augenrules'.=
 Of course, if someone generates<br>
/etc/audit/audit.rules directly, it could still fail, but I understand that=
 we are moving to using 'augenrules' by<br>
default.<br>
<br>
Patch (against current head) is below.<br>
<br>
Cheers,<br>
<br>
..Carlos..<br>
<br>
From 4ccae6353500d3870d4da8905ed01d18d36b066a Mon Sep 17 00:00:00 2001<br>
From: C de-Avillez &lt;cadeavil@microsoft.com&gt;<br>
Date: Fri, 10 Feb 2023 17:16:09 -0600<br>
Subject: [PATCH] augenrules: make sure no lines in *.rules ends in CRLF,<br=
>
&nbsp;otherwise 'auditctl -R' will then fail to fully load the rules.<br>
<br>
---<br>
&nbsp;init.d/augenrules | 1 +<br>
&nbsp;1 file changed, 1 insertion(+)<br>
<br>
diff --git a/init.d/augenrules b/init.d/augenrules<br>
index edb2199..f74c6e2 100644<br>
--- a/init.d/augenrules<br>
+++ b/init.d/augenrules<br>
@@ -84,6 +84,7 @@ BEGIN&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; minus_b =3D &quot;&quot;;<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rest =3D 0;<br>
&nbsp;} {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sub(/\r$/, &quot;&quot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (length($0) &lt; 1) { n=
ext; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (match($0, &quot;^\\s*#=
&quot;)) { next; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (match($0, &quot;^\\s*-=
e&quot;)) { minus_e =3D $0; next; }<br>
-- <br>
2.34.1<br>
<br>
<br>
<br>
&nbsp;<br>
&nbsp; <br>
<br>
&nbsp; <br>
Carlos<br>
&nbsp; de Avillez&nbsp;<br>
<br>
&nbsp; <br>
<br>
&nbsp;<br>
&nbsp;<br>
&nbsp; <br>
<br>
&nbsp; <br>
Senior<br>
&nbsp; Escalation Engineer<br>
<br>
&nbsp; Microsoft Azure Technical Support<br>
<br>
&nbsp; Customer Service and Support&nbsp;<br>
<br>
&nbsp; <br>
<br>
&nbsp; <br>
<br>
&nbsp; <br>
Office: +1 (469) 7753777&nbsp;<br>
<br>
&nbsp; <br>
cadeavil@microsoft.com&nbsp;<br>
<br>
&nbsp; <br>
Working<br>
&nbsp; hours: 10:00-19:00<br>
&nbsp; US Central Time&nbsp;<br>
<br>
&nbsp; <br>
Next days off during August 2020:&nbsp; 3, 10, 17, 24, 31&nbsp;<br>
<br>
&nbsp; <br>
<br>
&nbsp; <br>
<br>
<br>
&nbsp;<br>
If you need to work with another Support Engineer outside of my<br>
working hours, please send email to azurebu@microsoft.com with<br>
your case number, and availability.&nbsp;<br>
We are always interested to hear your feedback. Please feel free<br>
to reach my manager regarding the level of service you have received - &nbs=
p;spogge@microsoft.com<br>
<br>
Microsoft<br>
Azure | Azure<br>
Status | Support<br>
Plans | Create<br>
a Case | Privacy<br>
Policy&nbsp;<br>
&nbsp;<br>
<br>
<br>
--<br>
Linux-audit mailing list<br>
Linux-audit@redhat.com<br>
<a href=3D"https://listman.redhat.com/mailman/listinfo/linux-audit">https:/=
/nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flistman.redhat=
.com%2Fmailman%2Flistinfo%2Flinux-audit&amp;data=3D05%7C01%7Ccarlos.deavill=
ez%40microsoft.com%7C0d78e8a8334d4fcc044e08db0d4b362c%7C72f988bf86f141af91a=
b2d7cd011db47%7C1%7C0%7C638118388923975931%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi=
MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&=
amp;sdata=3DcKyVRKjwU5Rxd0xocsYa03Mjz39VYtmyWqsAjsgUipQ%3D&amp;reserved=3D0=
</a><br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BN7PR21MB1635C32B81A78262B147C1358F989BN7PR21MB1635namp_--

--===============9155692944059736272==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============9155692944059736272==--

