Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB166E4841
	for <lists+linux-audit@lfdr.de>; Mon, 17 Apr 2023 14:50:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681735815;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NhPEFGwxsqnrGyG3zoL9rsIHiaGMPJSIdOf8OKUNzqc=;
	b=URZLfHJFI/NBH4GctLLtM3pvtx9+UHsIfwTzluubFR4fQYWCSL5AJ+O5MbXGKFe+4swbSD
	rfpqvQUEPJUnt1OgPUVUpTYpk4Mtagp4E0kPw3/sGzpRiFVHz1L3cquG47+tphEyM969WW
	3Hb9ZHOpAjBe12uKlpH2Xgh+teydNlA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-y7iNshf-PSKCH7i92yYzAg-1; Mon, 17 Apr 2023 08:50:14 -0400
X-MC-Unique: y7iNshf-PSKCH7i92yYzAg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0B4E811E7C;
	Mon, 17 Apr 2023 12:50:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1AAA12166B29;
	Mon, 17 Apr 2023 12:50:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 97AE719465B2;
	Mon, 17 Apr 2023 12:49:59 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7E2DD1946588 for <linux-audit@listman.corp.redhat.com>;
 Mon, 17 Apr 2023 08:36:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2BBA5492B0D; Mon, 17 Apr 2023 08:36:12 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 22FCA492B0C
 for <linux-audit@redhat.com>; Mon, 17 Apr 2023 08:36:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03C658996E8
 for <linux-audit@redhat.com>; Mon, 17 Apr 2023 08:36:12 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-Mj9uKAO4M5-soSJPIMifUQ-1; Mon, 17 Apr 2023 04:36:10 -0400
X-MC-Unique: Mj9uKAO4M5-soSJPIMifUQ-1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="343593699"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; d="scan'208";a="343593699"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 01:35:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="1020340016"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; d="scan'208";a="1020340016"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 17 Apr 2023 01:35:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 01:35:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 17 Apr 2023 01:35:06 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 17 Apr 2023 01:35:05 -0700
Received: from DM8PR11MB5750.namprd11.prod.outlook.com (2603:10b6:8:11::17) by
 MN2PR11MB4519.namprd11.prod.outlook.com (2603:10b6:208:26c::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.45; Mon, 17 Apr 2023 08:35:04 +0000
Received: from DM8PR11MB5750.namprd11.prod.outlook.com
 ([fe80::65f0:6a4e:8aac:3e3e]) by DM8PR11MB5750.namprd11.prod.outlook.com
 ([fe80::65f0:6a4e:8aac:3e3e%2]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 08:35:04 +0000
From: "Reshetova, Elena" <elena.reshetova@intel.com>
To: "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>
Subject: [ANNOUNCE] [CFP] Linux Security Summit Europe (LSS-EU)
Thread-Topic: [ANNOUNCE] [CFP] Linux Security Summit Europe (LSS-EU)
Thread-Index: AdlxBvhHhF6rbpsrQ7SOGxoWhhjmbw==
Date: Mon, 17 Apr 2023 08:35:04 +0000
Message-ID: <DM8PR11MB57509BF8C3350944A3DB0A8FE79C9@DM8PR11MB5750.namprd11.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5750:EE_|MN2PR11MB4519:EE_
x-ms-office365-filtering-correlation-id: 79f4193e-2676-4bd1-4979-08db3f1ea45b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: HeSlJcRl8mo/Dpk2KCJzmHFfhR3gshk97opStzk9T6WysLZPJMeWlqEWqcmyxFxqJMvDlYRqzp3jijRcoGcEJ8taDHSo4SSQJiRP9+C8+w8bpVru+ZxaPFrIQoZJP9Dcsd24qwXW83/8xCdwx784ENJr+Ewa/1gONjfGD38PZCGS2IykGo1qAGuPdlgXKqujYUyCiMcnD0gUqvBBXJto7csJ+bXv4x8NlBcVd9mr423FvvyYZpW+5gnbW5/jSMjJkWQW0JQS9dC0ClTYlVw4BzO70xFYsk3rh5szgWrql5mzl45Zqshb4el9bRHmZR93NBhd39NTFLW8I3LaWN+OQVguiknKPIX4wAn1Or4feXsQkTqNS3TcV49UWeGoDrQgZFYWW3kBzIcQ21owouBFoN4gLLDpfXrrsNjVOvSLLPha4v19TqdZ7Z1pf6YDtLjJMEBh3uzTr6pAkchvmZRGHOEj7wREjuOZ+tGB7iKcgoA03KZALc86IGNhSyp0Xr33IBR9O8LAdhV2MNrMGWsjiaGo6Q4TZkxn5JlxSLQaLNyZ60G9hb/nx2XJ3AiUv3A09KoSeEAZfZ5V+3gxi8jYaP08mO/3shnWFCaofEYCC3tI3qtJUriVDR8QGFo9MseFhnbCtL4/TXraG4kE8Eobyw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(136003)(366004)(396003)(376002)(451199021)(55016003)(66476007)(76116006)(66946007)(82960400001)(66556008)(66446008)(64756008)(6916009)(4326008)(478600001)(316002)(54906003)(5660300002)(52536014)(8676002)(15650500001)(7416002)(41300700001)(122000001)(8936002)(38100700002)(186003)(83380400001)(9686003)(71200400001)(7696005)(26005)(6506007)(4744005)(966005)(33656002)(86362001)(38070700005)(2906002);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VW9weTNiNENPWmhLQ1RiT1NIQzcxNHlXN0lHa29RSzdNUW5VY3dYVDNkcWY1?=
 =?utf-8?B?R29Qc2Y4NFg3TEQyb3BJSVlzaWttS2hQaE9LWHk0aFZmL2Vaclh0NTdEdXgx?=
 =?utf-8?B?QmtTd0RQOWQ0emJMYU8zQjBheWllQndkOXhtZ2VGZHYzYTV6TU14RElkN29v?=
 =?utf-8?B?a3R0bTRvaWU5eldJUlNpWW5CUkxKa2xxcGk5RDZKMzJZSitKcmMvbFNxRDRC?=
 =?utf-8?B?Ykx1bVN2UzI5dU1KRU5DQ1lOMHlRZjN1ZWN6SHZ1cHJNNHJKSWxVNG5NM3l0?=
 =?utf-8?B?a0gwdThvcGRMSmt5OVd3enNMY3dwTnRIVnh1Zk8wTzgxeUxKWXRidS9CYzdh?=
 =?utf-8?B?S3ROVkFtVVd6Zmxid0NlNDA1WDBBQ2drZDRqQll2NHR1OTVFVXZGQkRVZU5o?=
 =?utf-8?B?R3ljK1U3N1h6WWhrNmhiUElHMXljcjFHMzRzME9wRVZucXF2SjFkcXNxWXpk?=
 =?utf-8?B?VksxZHVmb08raTFVZUlvWmVwYXNkc0VIa3hnaUVDZlV0eXMxOEdXTW5od2xG?=
 =?utf-8?B?eWsxa1FxdU4wYjhzQmIyL0NmQU1sZzJIL1dlM2NETGNvdTNBVG1nL0pOaEdn?=
 =?utf-8?B?ajRNM01LNmFrNTgvd0huRnptK0N1ekJQSllpRktLbjNaeEsyb3RLVVRpdk9y?=
 =?utf-8?B?bENxQXlpYmIvVExxeUxGZmg1bzlKdVlYQ3V1ajV6SUs3NGtmbXBmWWsxK2hD?=
 =?utf-8?B?OUZqL0tJUm0yUzBJQTlBbjMxTzdBSm5JcC9jUmlRSUFSeEFqdFdKSkhreDRB?=
 =?utf-8?B?eVkydWdKVnpicW50NUxoK3JtZUVMaUE5WXpxeExwcW5CZHliTGlQaThSdmRi?=
 =?utf-8?B?ak9TZkZVU2MvQVU1dlFGbC9aVjlmTXZna0JNZllQZExUZHdnbTBnV0JwakR1?=
 =?utf-8?B?aFhzeG1WR2pIc29SUndON0R6bmFteHh2UVBmMFZrTGpjc3FoMktybUxZakFD?=
 =?utf-8?B?TDF0U3VoeUdlTW5OQkpydUhLem1qempNSjlzSFYraDVXcFA3RVBqSllVN3Ni?=
 =?utf-8?B?Z25KTkNCb1JnMXVzSzQ4RzlSdVIwMVUzU2ZWWkpaaExoRWJNWDlJWFJBRStj?=
 =?utf-8?B?RG5RQ29sZjNXMTBqOG9aRVpvMGE1RWdBekhXVGNlbytzdE9NcktGb0VkSVFO?=
 =?utf-8?B?ZmYzZ3J0TjdxUHRMek90QlFMQXAxRzEyeEpYRUNjOXdJUkwxMDJHVlpOdGJI?=
 =?utf-8?B?VzNqdVNWYlpiOGkvOTNLT0lLWDk5c2ZrWnplbmRmRW9EZHZMRXZJTlFNTVRZ?=
 =?utf-8?B?dUozUXZQUjlZaFNxQkgxdko1UlBIWmUvNDJOZWUvTkJaaDJWWnk3VnNjTkhV?=
 =?utf-8?B?UEVEaGk0Rld2Q0s4NGgrcnZPdjhiYzlNT3ZVVUgzTDJSMVRweTljSDVaNklT?=
 =?utf-8?B?UEhJbnpwZ3NkVjNxeXhiU1M3V1BqaG15K2liM05lVzd4K1pRUUswRWVBVjdN?=
 =?utf-8?B?Z25RYVZyTjQ4WDhVS3U4V2MrTWJJbGNqcmxyS3V4MXd6bUlORFE4cWxNWE84?=
 =?utf-8?B?ZkpCVXByQS9QMllYMGQ3bXBUVDlnNFVtOU1lNHVLaGVybU5nMXI3ZXpDTkhs?=
 =?utf-8?B?a21rZ3d6YStseUNhMGxtZThNaTd4N2U4TGFTUjh6dWEwaHpJd1RlM2QxcHI1?=
 =?utf-8?B?MGxFMHRxcEE4dVVvdmpNWnNGcG5HZUVyY0dFeTZ3RWJSdW5tSTh1NzBJV2gy?=
 =?utf-8?B?dHN4RGNCQi9oRjVKcy9BSTVVcVZSaEJFTWdMSVlzVm5WeW5wTGt1SEN4ejBS?=
 =?utf-8?B?YjQvZjJjQm1MNlNRWUF0Y3MvS0tPVzhjTEczcmlxdkJEMVdoMk40cXhGZHEr?=
 =?utf-8?B?MmZvcytpSkNGc2N3WnFvZTFINmc2dVg4Tk85cEM1dHRRL0pRWHp1aWZCTXIz?=
 =?utf-8?B?WHdITTBLN3J1MTErd04vZ1NTV3NMNGdvUmRZSjlFY3NORWZrMytteWczU05h?=
 =?utf-8?B?a3YwQW00aU45RXBuSCt6cThRaEFlcWh6dUJ0OGZQY1grNHFJSEUxTTBWRVNK?=
 =?utf-8?B?M0hsSGVBdGI0NDQ2bW55cUxwL2tKZ2NuRWpMaWVlRGVoUTBoVGpsd29ZNnZt?=
 =?utf-8?B?TUNUcTFtdTQ1TmV3djlySHJqaXcvRHN5bG95Z056NklYUmp2S2dYNDAxQklV?=
 =?utf-8?Q?/PIGyDtJrzzYXpq/EMfiZy6Rm?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79f4193e-2676-4bd1-4979-08db3f1ea45b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2023 08:35:04.1795 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yvk0uINt0uTyZ7OH565tzyTk5d+mzjWAmXLAz5+UqaVLx+NNJ8/QPxc9mfDxxUdRwpWBxlNOM9hOJRBvluQrSVDmL8eujUi9XRkA1wrzsUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4519
X-OriginatorOrg: intel.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Mon, 17 Apr 2023 12:49:59 +0000
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
Cc: "lss-pc@lists.linuxfoundation.org" <lss-pc@lists.linuxfoundation.org>,
 Kernel Hardening <kernel-hardening@lists.openwall.com>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "tpmdd-devel@lists.sourceforge.net" <tpmdd-devel@lists.sourceforge.net>,
 Audit-ML <linux-audit@redhat.com>,
 "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "lwn@lwn.net" <lwn@lwn.net>,
 "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The Call for Participation for the 2023 LSS-EU conference is open!

See details of the event and information on submitting proposals here:
https://events.linuxfoundation.org/linux-security-summit-europe/

LSS-EU 2023 will be in Bilbao, Spain, from September 20th to September 21. 
This will be a two day event, co-located with Open Source Summit Europe [1].

The LSS-EU CFP is open until Monday, June 5.

Note that announcements relating to the Linux Security Summit may be found 
now on the Fediverse, via: https://social.kernel.org/LinuxSecSummit

Best Regards,
Elena Reshetova

[1] https://events.linuxfoundation.org/open-source-summit-europe/ 
--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

