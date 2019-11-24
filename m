Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5D05C108EE4
	for <lists+linux-audit@lfdr.de>; Mon, 25 Nov 2019 14:30:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574688644;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=t8g9FZXlQyAEd6KUvgx2y6OkdJJ09rTWqRqxMlCnsyc=;
	b=TsChO3OlDFUkz4jEkIFmgnZnTI9jOCTiXb6lfYdGrfvRQAe0iidJwaQk+Mv/uKhO0kLtnr
	Svilajs3En1HodvBjvn6zwdvTB+mk7yOYEe0gNwiVO/67tUM1KwGVqy5MwV68NN2sfqqQU
	1Wrb6T0ElVs6+8T6p7RxlwHcM+F0W18=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-CegfIUrgO3mze7SvhlkcoQ-1; Mon, 25 Nov 2019 08:30:36 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24022800594;
	Mon, 25 Nov 2019 13:30:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C15BDF6E5;
	Mon, 25 Nov 2019 13:30:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 07A7F4BB65;
	Mon, 25 Nov 2019 13:30:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAO6iCLh004276 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 24 Nov 2019 01:44:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C93832014E15; Sun, 24 Nov 2019 06:44:12 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C41BC2064017
	for <linux-audit@redhat.com>; Sun, 24 Nov 2019 06:44:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E30D804C89
	for <linux-audit@redhat.com>; Sun, 24 Nov 2019 06:44:10 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr140130.outbound.protection.outlook.com [40.107.14.130])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-298-J7D5pXL3MZq8NJE6mvlADw-1; Sun, 24 Nov 2019 01:44:06 -0500
Received: from AM0PR07MB4148.eurprd07.prod.outlook.com (52.133.59.151) by
	AM0PR07MB4564.eurprd07.prod.outlook.com (52.135.152.14) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2495.14; Sun, 24 Nov 2019 06:44:03 +0000
Received: from AM0PR07MB4148.eurprd07.prod.outlook.com
	([fe80::a8b7:80fe:fd07:1497]) by
	AM0PR07MB4148.eurprd07.prod.outlook.com
	([fe80::a8b7:80fe:fd07:1497%4]) with mapi id 15.20.2495.013;
	Sun, 24 Nov 2019 06:44:03 +0000
From: "Kadirvadivelu, Vezhavendan 1. (EXT - IN/Chennai)"
	<vezhavendan.1.kadirvadivelu.ext@nokia.com>
To: Steve Grubb <sgrubb@redhat.com>, "linux-audit@redhat.com"
	<linux-audit@redhat.com>
Subject: RE: Security audit rules
Thread-Topic: Security audit rules
Thread-Index: AdWWMyZTL2zLwTN+QTK6b84pFG3fdgI9hvaAAAyW0tAAfvZqgABOrEjA
Date: Sun, 24 Nov 2019 06:44:03 +0000
Message-ID: <AM0PR07MB41489140C4DD0E0017244C05B24B0@AM0PR07MB4148.eurprd07.prod.outlook.com>
References: <AM0PR07MB414818424612036066D01E9BB27B0@AM0PR07MB4148.eurprd07.prod.outlook.com>
	<20191119223243.inqd4yz5dsnr6gpg@madcap2.tricolour.ca>
	<AM0PR07MB4148C22E0204056F7EB36DC7B24F0@AM0PR07MB4148.eurprd07.prod.outlook.com>
	<2526162.J9WsBpnIYZ@x2>
In-Reply-To: <2526162.J9WsBpnIYZ@x2>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [49.206.12.117]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6fa0040a-bcf3-44fa-214c-08d770a9b237
x-ms-traffictypediagnostic: AM0PR07MB4564:
x-microsoft-antispam-prvs: <AM0PR07MB4564F11643D2509BB08E5A7FB24B0@AM0PR07MB4564.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 02318D10FB
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(39860400002)(346002)(396003)(136003)(376002)(189003)(199004)(13464003)(450100002)(86362001)(4326008)(6246003)(33656002)(186003)(3846002)(25786009)(66066001)(55016002)(7736002)(316002)(6306002)(6116002)(305945005)(76176011)(6436002)(229853002)(99286004)(74316002)(9686003)(7696005)(81156014)(2501003)(66946007)(3480700005)(8936002)(966005)(7116003)(55236004)(110136005)(66556008)(64756008)(8676002)(66476007)(76116006)(66446008)(102836004)(6506007)(26005)(53546011)(478600001)(71190400001)(71200400001)(5660300002)(11346002)(2906002)(446003)(14454004)(52536014)(14444005)(15650500001)(256004)(81166006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR07MB4564;
	H:AM0PR07MB4148.eurprd07.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 73xwAyufUNu5Jr5P7p0EaVuV//DNCUSXkslqhbYJb8loRo7wdKwGKu6dgCwIBS5jmkWF24QpczDKZlxhmq7E9GzVdIGKufOtLby5wtXyut0mguIYoaijs3lU9IVZFXP7aKmt4siKC/vGss14HsXAoBoRKQ0IArsgeHDFQTi6zKE92OKQxuAc2lPdvhauBa9zjGzzeN/KlLuWXhvcboGzque9fvQlmxXvxK6YIR1iQZ6fnsDBSHID2Nd+/NEDCFPdH1KUyIDpUn05C4+XQEiwMzAxSVLZ1tx4BsCkGkpgBKhzYazSVDdPXzLzuQCYp5Ggn3NxsP8VlLn4yvBXgvTCel8DlWR/e1QRbfRnGnB/P69i7j3St348v9TYWa0RHJdR7U8zq9n7xBx1riW5uT54cI+beGUXjfl2cnCvfif2kLmWV3saU5ZLFxjd0cnIv9M6nhHmkx2xhCSlEosVKgbvV1yYvXIM8iKPhNiVWdUvL9g=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa0040a-bcf3-44fa-214c-08d770a9b237
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2019 06:44:03.6516 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kQIg8KhuNvoP8WaUr6UZss5J7k20tqJ6TeND7HKadUtp1tvr9QzBH71z3sVmq4fU5HXuP1Vwi/kJhGcaDSk9gjYq16My/2h2YrRzT1m8fySfOKZObQCDmtoWBXLbbJHcLv4dyeUnJ+9LndQvzYCfAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB4564
X-MC-Unique: J7D5pXL3MZq8NJE6mvlADw-1
X-MC-Unique: CegfIUrgO3mze7SvhlkcoQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAO6iCLh004276
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 25 Nov 2019 08:30:17 -0500
Cc: Richard Guy Briggs <rgb@redhat.com>
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

That's clear on the rules. Thanks for that, but my question is where should I place the file called 'audit.rules'. It should be under '/etc/audit' or '/etc/audit/rules.d' or in both places.

Regards,
Vezhavendan K

-----Original Message-----
From: Steve Grubb <sgrubb@redhat.com> 
Sent: Friday, November 22, 2019 10:39 PM
To: linux-audit@redhat.com
Cc: Kadirvadivelu, Vezhavendan 1. (EXT - IN/Chennai) <vezhavendan.1.kadirvadivelu.ext@nokia.com>; Richard Guy Briggs <rgb@redhat.com>
Subject: Re: Security audit rules

On Tuesday, November 19, 2019 11:36:38 PM EST Kadirvadivelu, Vezhavendan 1. 
(EXT - IN/Chennai) wrote:
> I am using RHEL7.6 version (Red Hat Enterprise Linux 7 (Maipo)).

This distribution wants rules placed in /etc/audit/rules.d/ The audit package should have a file named README-rules that explains what is expected.

-Steve

> -----Original Message-----
> From: Richard Guy Briggs <rgb@redhat.com>
> Sent: Wednesday, November 20, 2019 4:03 AM
> To: Kadirvadivelu, Vezhavendan 1. (EXT - IN/Chennai) 
> <vezhavendan.1.kadirvadivelu.ext@nokia.com> Cc: linux-audit@redhat.com
> Subject: Re: Security audit rules
> 
> On 2019-11-08 12:52, Kadirvadivelu, Vezhavendan 1. (EXT - IN/Chennai)
wrote:
> > Hi,
> > 
> > In one of the VM I find audit.rules defined under /etc/audit as well 
> > as /etc/audit/rules.d.
> > 
> > What is the significance as well as difference between the files 
> > found in
> > 2 places.
> You haven't said what distro you are using.  In more recent distros, 
> the rules in rules.d are used by augenrules to populate audit.rules, 
> overwriting them.
> > Also please let me know what is the correct location where 
> > audit.rules need to be places.
> Depends on your distro.
> 
> > Vezhavendan K
> 
> - RGB
> 
> --
> Richard Guy Briggs <rgb@redhat.com>
> Sr. S/W Engineer, Kernel Security, Base Operating Systems Remote, 
> Ottawa, Red Hat Canada IRC: rgb, SunRaycer
> Voice: +1.647.777.2635, Internal: (81) 32635
> 
> 
> --
> Linux-audit mailing list
> Linux-audit@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-audit





--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

