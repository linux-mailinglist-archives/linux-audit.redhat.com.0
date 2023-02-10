Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F2E693A8A
	for <lists+linux-audit@lfdr.de>; Sun, 12 Feb 2023 23:48:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676242096;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Dg56DcftjRu7fumc1Hz7DxE6fB1jbm+4jddfrx3i4H4=;
	b=Y91zw2OErO1KY16uyg58pDDtYp/SOYwPTCBfHwuHW8c1qsSLkzcLTOH84XsM2P+srrZuQu
	CkxPoMgUCj1vmhPCS7fu6mqTk67Q57v8yZ8DFKANRT+UX03QMFC4WDgYJGsmdIuIT3d7lR
	kvrm0XJzjyCH4qj/m8KniFfKHTVXDEw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-540-RXmIW7zvMta9j38n660W_Q-1; Sun, 12 Feb 2023 17:48:14 -0500
X-MC-Unique: RXmIW7zvMta9j38n660W_Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5E7B3C0E442;
	Sun, 12 Feb 2023 22:48:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 674F9492B16;
	Sun, 12 Feb 2023 22:48:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DB0C419465B3;
	Sun, 12 Feb 2023 22:48:00 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 49DF2194658F for <linux-audit@listman.corp.redhat.com>;
 Fri, 10 Feb 2023 23:37:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5FC8A2026D68; Fri, 10 Feb 2023 23:37:14 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 56B5B2026D4B
 for <linux-audit@redhat.com>; Fri, 10 Feb 2023 23:37:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33197800050
 for <linux-audit@redhat.com>; Fri, 10 Feb 2023 23:37:14 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2101.outbound.protection.outlook.com [40.107.94.101]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-330-jqIO8LQwNZW4qnIj6ZARLA-2; Fri, 10 Feb 2023 18:37:11 -0500
X-MC-Unique: jqIO8LQwNZW4qnIj6ZARLA-2
Received: from BN7PR21MB1635.namprd21.prod.outlook.com (2603:10b6:406:b1::31)
 by SJ0PR21MB1983.namprd21.prod.outlook.com (2603:10b6:a03:294::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.7; Fri, 10 Feb
 2023 23:37:08 +0000
Received: from BN7PR21MB1635.namprd21.prod.outlook.com
 ([fe80::cb3f:4fda:24f:f9f5]) by BN7PR21MB1635.namprd21.prod.outlook.com
 ([fe80::cb3f:4fda:24f:f9f5%5]) with mapi id 15.20.6111.007; Fri, 10 Feb 2023
 23:37:07 +0000
From: Carlos De Avillez <Carlos.DeAvillez@microsoft.com>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Subject: small patch for issue with rules that have been (incorrecly) copied
 from Windows
Thread-Topic: small patch for issue with rules that have been (incorrecly)
 copied from Windows
Thread-Index: AQHZPaOfut61R/VCy0C+MqS6mxT7Rg==
Date: Fri, 10 Feb 2023 23:37:07 +0000
Message-ID: <BN7PR21MB163531AF592295002D4D37D98FDE9@BN7PR21MB1635.namprd21.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2023-02-10T23:37:07.575Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR21MB1635:EE_|SJ0PR21MB1983:EE_
x-ms-office365-filtering-correlation-id: 12507997-5a15-4d75-77ac-08db0bbfb94d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: C7PQ8kBzyYYhzt3nhs+vI75sHkhc1okyqFkS9ofOJzRSAMCCnonHnO1aWqXkA/pnM1LhKJ47HKVMOUXeigfFP8WBwzwhP4JK8RGaw4+IlPBnJUyjWeS2iJ2oPThRfy0Ju5dfsZv7QGJtIY065rbLo+oDsSM33KtXyXDl0y+zE4EW/PBFVVqPoEHTr25hndWE7CrJIJ24XKkRR1rQ4oP0s4D6f2X0nyIBoXAa+sgKzQZwNLa4gJm7Rsh27xcG7NBAMna9cQ4MhwKo47FmlS+dfvGjX4bfJp0dLz0zCGBOfQbbPOkqF90DJQzTaFyhnRfNtQF385X/Hruw4M7Zipvmt+hQuU+keyYXVS/QgLhHz4al8e7+2Rf50q684bEzQ+gaRPgCnmvWwvdQzzAm7p3C+wwM+MyQm8QDLjnUoiXXNtwZzLfOoiiLaS2T5WOmJu/N/1shfqBVBfcoLAUs7js+Tv7QvCVZZM3e98Bq8oHS1EICE/iq5Xh1NNzcD60uGMBRpHdLE8/F/JXtiIoqjx+WGWXnqxmrWf3FhrQsw85PPgBpAPi5GB54t6npAwQT3mgAd1apUChH0mOfUR2Dv6ZC+LwRKYOi0EjjXTqobaMIdH0ln5ehVnBEVfIohoRygZ2Qrq4tQ4HTSjsFE7uLNqBfnH7vH8HOADbt5S+7yD+MHF67HEa8w3gH66Zf+hGHqTfkb9JL+s+s3R2UXFgdI4ux5H+HCDmz/sftXYV/a7XI8P5nT2Q5XJOb9JGBVn/MO4JH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR21MB1635.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(346002)(136003)(366004)(396003)(376002)(451199018)(66946007)(38100700002)(82950400001)(82960400001)(122000001)(8990500004)(316002)(38070700005)(52536014)(8936002)(8676002)(76116006)(6916009)(41300700001)(66556008)(64756008)(66476007)(66446008)(2906002)(5660300002)(6506007)(91956017)(478600001)(53546011)(186003)(26005)(9686003)(33656002)(86362001)(83380400001)(71200400001)(7696005)(10290500003)(55016003)(66899018);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?27PjxfAY6xl+FNPd5Y2I2OIH+3r8AYXKLqMITRvYm3A/3t6SzTt9Qa3ffw?=
 =?iso-8859-1?Q?UAG51QmZ+A9PtZCZn/gUdej1SGjREBIx+cCxfpy43OkZ2TcWoQ8tOG/Cdr?=
 =?iso-8859-1?Q?9tDmV1TCNhHH1t9KA9w5KPvaOdmQAdVMOVqHmPlno3TJ9zoyQeW3gEcK5C?=
 =?iso-8859-1?Q?Ts0RUur+5VNs0fRNCevmzu1Hadqz6bGxk5U34Q9HAKVR/AZufSoHM2Wkov?=
 =?iso-8859-1?Q?fGqzEaL1XEGmGKY9Tvphqr9l3/ZgPMhgUFJ/AUtTJbkPKOmEjIlinykyVh?=
 =?iso-8859-1?Q?EDA5Ng1ISBfimbvhO2xYohLRjm7b8zL63hFr++RAzWAkRqrGjeSkAWeVgA?=
 =?iso-8859-1?Q?pHUB1LwW3feItw55GA8Satw0OnGtqzaUq2wuG0IHswmnb8q9AxhC/Rr2vN?=
 =?iso-8859-1?Q?2M8bgiQVwHM1BEStyDLIvcw+YM9ZYZyy9A8usPkaymK5/5fXUVMxcMGcNp?=
 =?iso-8859-1?Q?BvLZza39pM793ruxW5qazFE+i8izkG4d013BcCrExBXlCjogNuxz6cn4IL?=
 =?iso-8859-1?Q?Wb8ptwn81aBM9AGyhB5nC5808gPuxYT7o1Xo2JEOzJfOuaVIKbQ3eG09yG?=
 =?iso-8859-1?Q?i0iRMNrHF55+Uaf6r2VS7jrIKZaeZgJST/+HisBAvEuzfG839TCxR2gvw7?=
 =?iso-8859-1?Q?NKYuwe+LlVo2qY46Zp65fQvN3LH2yklR2JfQNBFFA85cu6URVk7py06ncf?=
 =?iso-8859-1?Q?k2ETbsE/rFYu5o0qhw+T3KxHr+owPmaG6R18Mns1bv+BlbS52F7x8fCowv?=
 =?iso-8859-1?Q?ZIOLTlI1msuE9tRedB8ILY2cFjrQqyzIgK0Nk9L+Tyd0cQwOcvVmZzu8wY?=
 =?iso-8859-1?Q?dPe2ddd1q4CfxTj9ju084Kdkydb+vVW9ruVp0mqoOIg4AXmo0m4G5iavJu?=
 =?iso-8859-1?Q?WtWLgBgUi3ah1Y97spZZDsF7XLCmSO3OToKwMCcPQQczPqL9NT5Z3PgvgY?=
 =?iso-8859-1?Q?kOwaqORS6JbchuGc3xQ3gPMKBx0W0wt5sktgLYgminFkynaKA7OzxayT5l?=
 =?iso-8859-1?Q?IN3lhuBdUQepms5Y9g6rRHXWJUCZuKBB5WZJGUNWy0LlLrke7GEzK1wh/G?=
 =?iso-8859-1?Q?Fl5q2HdQqkdQrhVuHXr89tj/ALUHH3wLNnKOnHfqM1QqR6W+VE5YcYq/pN?=
 =?iso-8859-1?Q?JPWwBdKCgraTxqO6RHwfc3R7NflDjkSDX3VfmXyvI+0X5wXr+cNf0+uKQr?=
 =?iso-8859-1?Q?6gq5liW7tVRKOA/sph9ZHAEnw2iYdw4RUhop4lrnqiXDw01mi/kK/oqhid?=
 =?iso-8859-1?Q?/EeJtLQpw0bEmfmI/8fASCQ/036VVue1qivbZ3Wf3os1GIAgjj+LKlGCS2?=
 =?iso-8859-1?Q?//v1OlELkEDrGkKaE5/iM11VcG+skPChvBNDY23ZHpNzzBxD/L830xctGg?=
 =?iso-8859-1?Q?SnQPRgXP9m7IdOJqnacqhW7v4JqFq6ITjY2jH8sm7S3SCmsid2ht9uLGmV?=
 =?iso-8859-1?Q?CsYlcwnha2kaUOuZRzpQ9rY8a+xcQ4Wq0fh5wrdqJ6a7CvQZCFfYlRt4Ab?=
 =?iso-8859-1?Q?yPKiG3lbPfCNQKTTHfyadekPgdCtlfNplBzY78hNH3fLl9rD1wVTN8PkF6?=
 =?iso-8859-1?Q?lbOGgqBq30jIDqAO+xlVX0v+055eu7gbb+zEDvJdf1Z6j7oLgTA3ok2bCc?=
 =?iso-8859-1?Q?bFuowH4NluJpfC0Ro/yzfAFeRIcCMHzSfS?=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR21MB1635.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12507997-5a15-4d75-77ac-08db0bbfb94d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2023 23:37:07.7953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PGTY12BpD/Y+YWW15TyB5ojB2GZLOL9vsepYf26UeluhCttjW5lPNNSVugHe8NwtCbKzhPbiNEwZeNQed0lJCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR21MB1983
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Sun, 12 Feb 2023 22:47:58 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

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
--=20
2.34.1



=20
 =20

 =20
Carlos
  de Avillez=A0

 =20

=20
=20
 =20

 =20
Senior
  Escalation Engineer

  Microsoft Azure Technical Support

  Customer Service and Support=A0

 =20

 =20

 =20
Office: +1 (469) 7753777=A0

 =20
cadeavil@microsoft.com=A0

 =20
Working
  hours: 10:00-19:00
  US Central Time=A0

 =20
Next days off during August 2020:=A0 3, 10, 17, 24, 31=A0

 =20

 =20


=20
If you need to work with another Support Engineer outside of my
working hours, please send email to azurebu@microsoft.com with
your case number, and availability.=A0
We are always interested to hear your feedback. Please feel free
to reach my manager regarding the level of service you have received - =A0s=
pogge@microsoft.com

Microsoft
Azure | Azure
Status | Support
Plans | Create
a Case | Privacy
Policy=A0
=A0


--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

