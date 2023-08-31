Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B88F78ED3C
	for <lists+linux-audit@lfdr.de>; Thu, 31 Aug 2023 14:35:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693485341;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vKBabzQKjrT7I/QbMeMqSvmIdy6JdcnPvcr/NCOLa18=;
	b=iEXQM2AWoDx7a5JUEqJlVnB68ROM52YQ/AikITDRoEWOSNVkKOwRg+28dsdMTrqJ2b9nqX
	OlTG8t7MkoaMNIrH3rYzipCh29XXiQhd6d5ysy+Mntg/DtbyWA2XpDmHeL4rAQK7NTThMU
	TafV12RmIwdPyIcNwcaZ/U6kG6FLepI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-36-GhSyr7f3Mj2xxYiXl1poYg-1; Thu, 31 Aug 2023 08:35:37 -0400
X-MC-Unique: GhSyr7f3Mj2xxYiXl1poYg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A5D5280D589;
	Thu, 31 Aug 2023 12:35:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E226C2026D35;
	Thu, 31 Aug 2023 12:35:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 20B8819452C9;
	Thu, 31 Aug 2023 12:35:11 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 338B81946589 for <linux-audit@listman.corp.redhat.com>;
 Thu, 31 Aug 2023 09:34:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1E2D5492C14; Thu, 31 Aug 2023 09:34:12 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 15774492C13
 for <linux-audit@redhat.com>; Thu, 31 Aug 2023 09:34:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E4DDC3C13507
 for <linux-audit@redhat.com>; Thu, 31 Aug 2023 09:34:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-677-GED9lEE1OtaZWqNilFnzFA-1; Thu, 31 Aug 2023 05:34:09 -0400
X-MC-Unique: GED9lEE1OtaZWqNilFnzFA-1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="378592327"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="378592327"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 02:33:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="733029026"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="733029026"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Aug 2023 02:33:06 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 02:33:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 02:33:04 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 31 Aug 2023 02:33:04 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 31 Aug 2023 02:33:04 -0700
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SN7PR11MB6851.namprd11.prod.outlook.com (2603:10b6:806:2a3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Thu, 31 Aug
 2023 09:33:02 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5%7]) with mapi id 15.20.6699.035; Thu, 31 Aug 2023
 09:33:02 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: "paul@paul-moore.com" <paul@paul-moore.com>
Subject: Re: [pcmoore-audit:main 1/1] README.orig: warning: ignored by one of
 the .gitignore files
Thread-Topic: [pcmoore-audit:main 1/1] README.orig: warning: ignored by one of
 the .gitignore files
Thread-Index: AQHZ2vjhP2YWrrNO9kmumR8Ti6ApjLAC5uUAgAE+CQA=
Date: Thu, 31 Aug 2023 09:33:02 +0000
Message-ID: <4d8308622a1513099fe461ed41409c3768d95946.camel@intel.com>
References: <202308301248.hEwyeVEl-lkp@intel.com>
 <CAHC9VhQZFZTaXb_S5YCy9KniVfPBmEQrY74_dMi5cBftZsrwNg@mail.gmail.com>
In-Reply-To: <CAHC9VhQZFZTaXb_S5YCy9KniVfPBmEQrY74_dMi5cBftZsrwNg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|SN7PR11MB6851:EE_
x-ms-office365-filtering-correlation-id: d4f6409f-cc3c-4655-1955-08dbaa0545cc
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: 0qTOvtzw1benkTTI2Hhyu+mkOOdvbjfCin4KLgYX8Nr3yWhC3dA2rMGFWnDVQ6wXggzzPOuLqiZ+SSVy2dY2eCzB39yRujamAmuXggRnDzcb839sQSpmnZkpYbbzUvSulC70KuH/Ow8LxwfKdndZcNVbapMuzN+8jxuUqhIu1FgppxldnYFUUnLEZRwgxs5YrcTp/oeeTSh26R9IvJN6OgRxQu1OE+806CLNPJRLJljmK9QzpzdU2W1H9j+liW3pmHCKIj1auTfTKzOxcK3bk/m/Xb8dY3EfBklQaSqIzdxC5qBy4cX9Ftka0HmKPOgb+cIUPJMRDgRpOvsd3Drq8UmcIfgE6O/WWvoF4+L7wTPjc5dPEUnuA9f5nFDgKnUonJY3rQMfA1VZnKJ2k0C8tD7waAV5R5np1njCFm6arYJm/IIljtE4lVzab3OOQq14kREFilulfiBspp6+oX9VZO+BOa/nn+c+SVxgcyqYm5418+k1JSQ2MSKyoVzdL+BlYsaC8a+DVvYrwKPC1aMrcNKs3hxgjIORJg1pxbjVjrxq9Nrv5H7v+FvBpwFZQRlCUCDEs3I68OrBPXfVHIk0UkxKiXHr8m8968CT4U+Kxcxxryr+17KHqj6VdpPAn1hF0AeSWy2gm98/JseF42JvB1+NaEq53wWIAbK5SXVonCc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6392.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(376002)(396003)(346002)(186009)(451199024)(1800799009)(91956017)(26005)(107886003)(38100700002)(53546011)(6512007)(6486002)(6506007)(5660300002)(71200400001)(38070700005)(122000001)(82960400001)(4326008)(8676002)(8936002)(478600001)(966005)(2616005)(83380400001)(86362001)(66946007)(76116006)(54906003)(64756008)(6916009)(66446008)(66476007)(2906002)(36756003)(316002)(66556008)(41300700001)(142923001);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?alhjQ204L01ZL1RlM1BsUGV3VkViTEJNOHlOZ1VtRWtZSldZdzNQcC9VVnJy?=
 =?utf-8?B?aWd4RmZ1cXFrVS93Z0dMOU1ab2l1ckxzQTkxSERwUzJHc042ZE55ZnpYTitL?=
 =?utf-8?B?MnRlY2JlTWpCZEZBaGQ1UUxjb3M2VjR1b0VUR0Eya3AzeGZLT0hNWmF0LzA3?=
 =?utf-8?B?RkU3Uy9pUzQ1SFp2ZHNza29VdEtNbndBVHNnSk54K0tKTGc3dENNd3BudWs5?=
 =?utf-8?B?VEJUVTBtdWtSdzZWZnV0VzRtaU51QjZOM2p4bGJiR2ZoWVRub1oyVFJwNEpZ?=
 =?utf-8?B?TnN3YlpXaiszWVluZlRLQ0c5NnJDdFo1bU5INTZDRENrY056SzdoYm5La0U3?=
 =?utf-8?B?SHk1ZFJKbndRejBxQUNENGVuL2pGL0NYM0VkMW5ONjdFRGlVa1RMTHpuL0dM?=
 =?utf-8?B?MU5sNG1CeUpSMHhFa3ZXNVNMeTlPcmFVQmtxeGZsYTEwSVFld2djN0ZIaXJJ?=
 =?utf-8?B?TTVkd1lxOVhqb1RGU2IwZXQrQ01nQ2xuMzFGc3RMV2dhWVB0aXBlOFJIMm0v?=
 =?utf-8?B?SEhyUENPYVZHc3VoU0xxQ2lBa3Qvdk0yT0NudDFBL2xnNUJFZWlWdExWL3di?=
 =?utf-8?B?eXNzOUt3bmpBZUR5anpWcExEUjM3YzZHL1BBWTFtRkIrdmJRUklURGxZQWps?=
 =?utf-8?B?UEtSelB6ZHRlVG83a2dKZ0xCaGtLeDNyMkN6UGhMWEVGeGZtRG5mRmxqSzJB?=
 =?utf-8?B?L1BROC9Wdkp1cGROdEhKV291eWhyVXNiWURmZXR4OHVaMkZSa0ZESmpMY3VD?=
 =?utf-8?B?bTFUSzhtcTFDWncxUi9WMW1ZZ3RjaUFvMUZCRCtxMHpPSXVJSXQ5QjAydWpJ?=
 =?utf-8?B?RUgvb2NSTnVQTHMwdEdiSnZyWnhYWlRZRjdFaXVWTyt2OE42ZS9GYWhEUXIy?=
 =?utf-8?B?cXRMRFNsQVhQZWp0SnplNVFLQmRNUUNCK0VTWit2U1JaSVF0OTlBeGZnYWdn?=
 =?utf-8?B?ZVZLSU5LWVZJUHNWdUNKQjQrdExaTXBHMTBVR0owalJtejBxbEhhNHVwMnQ4?=
 =?utf-8?B?NGt0YmYrcEFDVTdtTVhsZTk2REJYWUxpcXE5QVFMNlExNWxVSWMremE5Vzl5?=
 =?utf-8?B?aGpPR0V2bDVlenFReWxKRUgybURMT3dZcnZWNkkyQ2Z6Tnc1SThKaWRpVDVw?=
 =?utf-8?B?OWRSYThyRzlncHNRN21zb3ArUXNVOXJmSC9PWUx1MkRmNkZRMVAxV1lieVRs?=
 =?utf-8?B?aHFlQ2dDS2kzNzdmMGFzSWFLSUVMbndmTTgrYkRMVi93b0owZTZGaG1ZUDZr?=
 =?utf-8?B?V3FsMmVadUhTVGZxOFYyNzV2UUs5WHNWbUFJRkU5ZmZJbVFPTm9hYXk5bkE3?=
 =?utf-8?B?S1pRVG41dnQ3YkdkQzRzZVNxU1RhSWhkcXhjRHZqSjRBc25YZEpXZlNOU282?=
 =?utf-8?B?aUZ1RGdIM3pUZmZhbkRqZkFWdlRuL0QwaTE0Z1l3amFnT3RLandiQWp1V1VR?=
 =?utf-8?B?dmpMUTk2Ym9YaDdrK0w0aVVYV2Rvemp0NzNBU1ZnMTZucnRjdFdvbHhkVmdH?=
 =?utf-8?B?S1plUUZRTmN3ZWNWbUQwLzN1eUlic05CWmJUaG9xZXlxaExSWGh6NG5VTnlD?=
 =?utf-8?B?Vi9uM1VjQ2JuRituZlNEdzRUOTVDT0x1c2JkSTlMRlhNK2NjQ1Jja0c0T1VG?=
 =?utf-8?B?VmhSTmZiSktyS2hmK0RmMjYzL2k5MlZIbTNxdHdKTklrbU4yNklHVWRvd0Jk?=
 =?utf-8?B?QkxPNEt5enNkUnF4WGdXNWdKL1phMFJuYStmK29MQkkveDU1TWcwbVFseVg5?=
 =?utf-8?B?NmNTSDhpL0VuVUw0UXZkWW80WmZFUUlPZkpSRVFOZFRtR0FFdnoxQkl4dGJD?=
 =?utf-8?B?YkRxYy9iSU9jTTYwQjNZeExaOThsejlpRStBSWNkV0g0aDhqZWlLRm9xN0hl?=
 =?utf-8?B?WnNNaGVNc2Ivc3VCaTlzY0d3RUxMcHhDeE9YTTUvV2FKS092VVZ3dHBKYXV6?=
 =?utf-8?B?MTBONitQYWFxSFpBcjR5Zlp4TUg3Z1FmTFZMdVB6cnhtQ0FnLzdnaXdjd2Zw?=
 =?utf-8?B?ODRhenN6S3A1VVJXSnNDbEdPM0kzLzRrQjdyVFhheWlzSmV6NjJsb0hEWGhO?=
 =?utf-8?B?R1FNQXhqRXkrUFlpWC92cU80SldUQWNuaXVGckFkeEZycHh4T3paMUkrbGRB?=
 =?utf-8?Q?fboLamPP6n24tn1eE1j+X1eda?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f6409f-cc3c-4655-1955-08dbaa0545cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2023 09:33:02.5041 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0/aAlHmOZwaKMCQhG5aCAA+2ujv9Rw1+yc1xitduRhhTEWlyUhZAxfS/Mxeism+VBcVWjPFQtfjmQ5B5y2W9Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6851
X-OriginatorOrg: intel.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Thu, 31 Aug 2023 12:34:34 +0000
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
Cc: "audit@vger.kernel.org" <audit@vger.kernel.org>,
 "linux-audit@redhat.com" <linux-audit@redhat.com>, lkp <lkp@intel.com>,
 "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: intel.com
Content-Language: en-US
Content-ID: <2AE4EA8AD033ED4E9BB2098615150181@namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDIzLTA4LTMwIGF0IDEwOjI5IC0wNDAwLCBQYXVsIE1vb3JlIHdyb3RlOg0KPiBP
biBXZWQsIEF1ZyAzMCwgMjAyMyBhdCAxMjoxN+KAr0FNIGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BA
aW50ZWwuY29tPg0KPiB3cm90ZToNCj4gPiB0cmVlOsKgwqANCj4gPiBodHRwczovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9wY21vb3JlL2F1ZGl0LmdpdMKgbQ0KPiA+
IGFpbg0KPiA+IGhlYWQ6wqDCoCA5NGU1ZWY5YjE1N2M2YzM3NzkzNTJhOGQ0MTIxNTQyZjcxZGU1
MmExDQo+ID4gY29tbWl0OiA5NGU1ZWY5YjE1N2M2YzM3NzkzNTJhOGQ0MTIxNTQyZjcxZGU1MmEx
IFsxLzFdIGF1ZGl0OiBhZGQgYQ0KPiA+IExpbnV4IEF1ZGl0IHNwZWNpZmljIFJFQURNRS5tZCBh
bmQgU0VDVVJJVFkubWQNCj4gPiBjb25maWc6IHBhcmlzYy1yYW5kY29uZmlnLXIwMTItMjAyMzA4
MzANCj4gPiAoaHR0cHM6Ly9kb3dubG9hZC4wMS5vcmcvMGRheS1jaS9hcmNoaXZlLzIwMjMwODMw
LzIwMjMwODMwMTI0OC5oRXd5DQo+ID4gZVZFbC1sa3BAaW50ZWwuY29tL2NvbmZpZykNCj4gPiBj
b21waWxlcjogaHBwYS1saW51eC1nY2MgKEdDQykgMTMuMi4wDQo+ID4gcmVwcm9kdWNlICh0aGlz
IGlzIGEgVz0xIGJ1aWxkKToNCj4gPiAoaHR0cHM6Ly9kb3dubG9hZC4wMS5vcmcvMGRheS1jaS9h
cmNoaXZlLzIwMjMwODMwLzIwMjMwODMwMTI0OC5oRXd5DQo+ID4gZVZFbC1sa3BAaW50ZWwuY29t
L3JlcHJvZHVjZSkNCj4gPiANCj4gPiBJZiB5b3UgZml4IHRoZSBpc3N1ZSBpbiBhIHNlcGFyYXRl
IHBhdGNoL2NvbW1pdCAoaS5lLiBub3QganVzdCBhDQo+ID4gbmV3IHZlcnNpb24gb2YNCj4gPiB0
aGUgc2FtZSBwYXRjaC9jb21taXQpLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWdzDQo+ID4gPiBS
ZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+DQo+ID4gPiBDbG9z
ZXM6DQo+ID4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjMwODMw
MTI0OC5oRXd5ZVZFbC1sa3BAaW50ZWwuY29tLw0KPiA+IA0KPiA+IEFsbCB3YXJuaW5ncyAobmV3
IG9uZXMgcHJlZml4ZWQgYnkgPj4pOg0KPiA+IA0KPiA+ID4gPiBSRUFETUUub3JpZzogd2Fybmlu
ZzogaWdub3JlZCBieSBvbmUgb2YgdGhlIC5naXRpZ25vcmUgZmlsZXMNCj4gPiDCoMKgIHRvb2xz
L3BlcmYvdXRpbC9icGZfc2tlbC92bWxpbnV4L3ZtbGludXguaDogd2FybmluZzogaWdub3JlZCBi
eQ0KPiA+IG9uZSBvZiB0aGUgLmdpdGlnbm9yZSBmaWxlcw0KPiA+IMKgwqAgdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMvYXJtNjQvdGFncy8uZ2l0aWdub3JlOiB3YXJuaW5nOiBpZ25vcmVkDQo+ID4g
Ynkgb25lIG9mIHRoZSAuZ2l0aWdub3JlIGZpbGVzDQo+ID4gwqDCoCB0b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9hcm02NC90YWdzL01ha2VmaWxlOiB3YXJuaW5nOiBpZ25vcmVkIGJ5DQo+ID4gb25l
IG9mIHRoZSAuZ2l0aWdub3JlIGZpbGVzDQo+ID4gwqDCoCB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9hcm02NC90YWdzL3J1bl90YWdzX3Rlc3Quc2g6IHdhcm5pbmc6DQo+ID4gaWdub3JlZCBieSBv
bmUgb2YgdGhlIC5naXRpZ25vcmUgZmlsZXMNCj4gPiDCoMKgIHRvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2FybTY0L3RhZ3MvdGFnc190ZXN0LmM6IHdhcm5pbmc6IGlnbm9yZWQNCj4gPiBieSBvbmUg
b2YgdGhlIC5naXRpZ25vcmUgZmlsZXMNCj4gPiDCoMKgIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2t2bS8uZ2l0aWdub3JlOiB3YXJuaW5nOiBpZ25vcmVkIGJ5IG9uZQ0KPiA+IG9mIHRoZSAuZ2l0
aWdub3JlIGZpbGVzDQo+ID4gwqDCoCB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vTWFrZWZp
bGU6IHdhcm5pbmc6IGlnbm9yZWQgYnkgb25lIG9mDQo+ID4gdGhlIC5naXRpZ25vcmUgZmlsZXMN
Cj4gPiDCoMKgIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9jb25maWc6IHdhcm5pbmc6IGln
bm9yZWQgYnkgb25lIG9mDQo+ID4gdGhlIC5naXRpZ25vcmUgZmlsZXMNCj4gPiDCoMKgIHRvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9zZXR0aW5nczogd2FybmluZzogaWdub3JlZCBieSBvbmUg
b2YNCj4gPiB0aGUgLmdpdGlnbm9yZSBmaWxlcw0KPiANCj4gSSBoYXZlIG5vIGlkZWEgaWYgdGhl
cmUgaXMgYSBwZXJzb24gYXR0YWNoZWQgdG8gYW55IG9mIHRoZSBhZGRyZXNzZXMNCj4gb24gdGhl
IFRvIGxpbmUgYWJvdmUsIGJ1dCBwbGVhc2Ugc2VuZCBhdWRpdCBrZXJuZWwgaXNzdWVzIHRvDQo+
IGF1ZGl0QHZnZXIua2VybmVsLm9yZ8KgYW5kIG5vdCBsaW51eC1hdWRpdEByZWRoYXQuY29tLg0K
DQpTb3JyeSBmb3IgdGhlIGluY29udmVuaWVuY2UuIFdlJ3ZlIHVwZGF0ZWQgdGhlIGJvdCdzIGVt
YWlsDQpjb25maWd1cmF0aW9uIHRvIHNlbmQgYXVkaXQtcmVsYXRlZCByZXBvcnRzIHRvIGF1ZGl0
QHZnZXIua2VybmVsLm9yZy4NCg0KLS0NCkJlc3QgUmVnYXJkcywNCll1amllDQotLQpMaW51eC1h
dWRpdCBtYWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4u
cmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0Cg==

