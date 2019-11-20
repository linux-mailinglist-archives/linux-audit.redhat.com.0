Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A43C31072BE
	for <lists+linux-audit@lfdr.de>; Fri, 22 Nov 2019 14:07:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574428071;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pgIOOGUxDze2y/J5p3lYFSwb4zF4YBZxfhx+xeh7Kok=;
	b=MpE1fgE/eAMDnPlXADnB/WiDih844b1jVDnQPO7lH7zkdnkYd/vsN2LxTALebWTLLVJ5A8
	qFJG3TYDYXbkocZSA3lneNvxjCKOs5qhzGHwhGRtKomeRa1pBY0WXR2OQdVe53nbFmbw0x
	vgdk6Ak/xBbmhIBQhN46fdJUpcAMuJU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-i95BKASEPCq35junR5zOUg-1; Fri, 22 Nov 2019 08:07:49 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D93E61005513;
	Fri, 22 Nov 2019 13:07:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A67564020;
	Fri, 22 Nov 2019 13:07:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2EB8918089CF;
	Fri, 22 Nov 2019 13:07:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAK4alI4017031 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 19 Nov 2019 23:36:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A80EB2022ACC; Wed, 20 Nov 2019 04:36:47 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A2EE42017F02
	for <linux-audit@redhat.com>; Wed, 20 Nov 2019 04:36:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40D5E101A55E
	for <linux-audit@redhat.com>; Wed, 20 Nov 2019 04:36:45 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr00101.outbound.protection.outlook.com [40.107.0.101])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-211-HptME1nnP_6VxeeZlsVtjA-1; Tue, 19 Nov 2019 23:36:40 -0500
Received: from AM0PR07MB4148.eurprd07.prod.outlook.com (52.133.59.151) by
	AM0PR07MB4596.eurprd07.prod.outlook.com (52.135.151.145) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2474.10; Wed, 20 Nov 2019 04:36:38 +0000
Received: from AM0PR07MB4148.eurprd07.prod.outlook.com
	([fe80::a8b7:80fe:fd07:1497]) by
	AM0PR07MB4148.eurprd07.prod.outlook.com
	([fe80::a8b7:80fe:fd07:1497%4]) with mapi id 15.20.2474.015;
	Wed, 20 Nov 2019 04:36:38 +0000
From: "Kadirvadivelu, Vezhavendan 1. (EXT - IN/Chennai)"
	<vezhavendan.1.kadirvadivelu.ext@nokia.com>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: RE: Security audit rules
Thread-Topic: Security audit rules
Thread-Index: AdWWMyZTL2zLwTN+QTK6b84pFG3fdgI9hvaAAAyW0tA=
Date: Wed, 20 Nov 2019 04:36:38 +0000
Message-ID: <AM0PR07MB4148C22E0204056F7EB36DC7B24F0@AM0PR07MB4148.eurprd07.prod.outlook.com>
References: <AM0PR07MB414818424612036066D01E9BB27B0@AM0PR07MB4148.eurprd07.prod.outlook.com>
	<20191119223243.inqd4yz5dsnr6gpg@madcap2.tricolour.ca>
In-Reply-To: <20191119223243.inqd4yz5dsnr6gpg@madcap2.tricolour.ca>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2405:204:7204:c728:717f:e68:e76d:ffb6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8fc5ea50-177a-474e-b016-08d76d733bc8
x-ms-traffictypediagnostic: AM0PR07MB4596:
x-microsoft-antispam-prvs: <AM0PR07MB4596FC9C4F050E59BF341903B24F0@AM0PR07MB4596.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 02272225C5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(39860400002)(346002)(376002)(366004)(136003)(13464003)(189003)(199004)(52536014)(25786009)(450100002)(8936002)(2906002)(229853002)(256004)(14444005)(81156014)(7696005)(6916009)(81166006)(3480700005)(86362001)(7116003)(99286004)(76176011)(186003)(4326008)(6246003)(53546011)(6506007)(102836004)(66446008)(64756008)(66556008)(66476007)(478600001)(66946007)(15650500001)(8676002)(74316002)(33656002)(316002)(7736002)(305945005)(76116006)(5660300002)(55016002)(6436002)(9686003)(476003)(486006)(6116002)(71190400001)(71200400001)(46003)(11346002)(14454004)(446003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR07MB4596;
	H:AM0PR07MB4148.eurprd07.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3chyK2RinYEHtoROnSnu/issk5TxNYE9DUsTy+ClOZUrRwGwubI9EZqh2GTZM35hWg8F93jDxqyrscShTXK2Bb3PHCLsRJv6e1WslbYfQE4wJMsCEtYEeimYiYW00rC9EZeH0yCHa6aWIEuQeOBe1T5M6R6nmOJjObHNb20cQiFa2o+cucmM5qpIfmUgYtuX9YkyjZG9a+XO3SOn3ErNn8gC/J8QV4D/O4GfwOd2uCh0IqmlXxhPOz+xv+lwpssVrvxUIcxKFJiPZA7tTQvIE1JDtW7nybaNwj5uSEDnK4knJb9Z0Q9gC6Wu6uqh7tSQmQNZye6D3/+7bYRVA4nNLHwGj2tIxMoliYeJLEllIkx1D/3xrCup1WDoisQzK3pGoiLZAFsQFOwiMLQT53iF0ZtAtXWqRzjG7+mr2M+qacSuCcLiiN+AK1CheOu11rrl
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc5ea50-177a-474e-b016-08d76d733bc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2019 04:36:38.6489 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pFRXBaxaQXIkizi4c4kDjNIhLz8cuRem5a7Tkwd+QsMrOfjEFGVRsnknoyCQOvLRtOMSFntip1qSmbMZeIVq5V2DNr0VaTFsLj4Y6a+jse0zndT/x3CkI2i3iKAP7Dy3l1Oo5iQXKgjtBaTDOydCuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB4596
X-MC-Unique: HptME1nnP_6VxeeZlsVtjA-1
X-MC-Unique: i95BKASEPCq35junR5zOUg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAK4alI4017031
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 22 Nov 2019 08:07:21 -0500
Cc: "linux-audit@redhat.com" <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

I am using RHEL7.6 version (Red Hat Enterprise Linux 7 (Maipo)).

Regards,
Vezhavendan K

-----Original Message-----
From: Richard Guy Briggs <rgb@redhat.com>=20
Sent: Wednesday, November 20, 2019 4:03 AM
To: Kadirvadivelu, Vezhavendan 1. (EXT - IN/Chennai) <vezhavendan.1.kadirva=
divelu.ext@nokia.com>
Cc: linux-audit@redhat.com
Subject: Re: Security audit rules

On 2019-11-08 12:52, Kadirvadivelu, Vezhavendan 1. (EXT - IN/Chennai) wrote=
:
> Hi,
>=20
> In one of the VM I find audit.rules defined under /etc/audit as well as /=
etc/audit/rules.d.
>=20
> What is the significance as well as difference between the files found in=
 2 places.

You haven't said what distro you are using.  In more recent distros, the ru=
les in rules.d are used by augenrules to populate audit.rules, overwriting =
them.

> Also please let me know what is the correct location where audit.rules ne=
ed to be places.

Depends on your distro.

> Vezhavendan K

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems Remote, Ottawa, R=
ed Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

