Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AAE5F7264
	for <lists+linux-audit@lfdr.de>; Fri,  7 Oct 2022 02:57:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665104263;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OQZ6josK09HZ8cJlJ2wsADIQWYYXgO5TbPQWzMjrmMY=;
	b=LpC59G8fZT8FK3uFYNIr3aNH9V4Wo1FMkrL61NYWo17zzSyUACoEsWOWJuDPU2bVjVOkj5
	4axQlzICZczJuZKaSER1P+3StopziT8FUSRwd7BB4CfTzpguZQatFg6Nrl9huGBUf1ifnC
	wlrr0aIUQ5qplQYxpmu1Hg8UeGNSwmM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-96-CGKvq_GuOIOhqsJYu_0RbA-1; Thu, 06 Oct 2022 20:57:40 -0400
X-MC-Unique: CGKvq_GuOIOhqsJYu_0RbA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E04708432D0;
	Fri,  7 Oct 2022 00:57:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 85D18C15BA4;
	Fri,  7 Oct 2022 00:57:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 221991946A69;
	Fri,  7 Oct 2022 00:57:38 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A163F1946588 for <linux-audit@listman.corp.redhat.com>;
 Fri,  7 Oct 2022 00:57:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 70A8153593C; Fri,  7 Oct 2022 00:57:37 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6868045359A
 for <linux-audit@redhat.com>; Fri,  7 Oct 2022 00:57:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 482358432AF
 for <linux-audit@redhat.com>; Fri,  7 Oct 2022 00:57:37 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-5azo-0UIN8WXyF-63z2ttQ-1; Thu, 06 Oct 2022 20:57:33 -0400
X-MC-Unique: 5azo-0UIN8WXyF-63z2ttQ-1
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 296Nwt91022957;
 Fri, 7 Oct 2022 00:57:32 GMT
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jxd5tnpxc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Oct 2022 00:57:32 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2970KTuR020674; Fri, 7 Oct 2022 00:57:31 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3jxc06nh5j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Oct 2022 00:57:31 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by SJ1PR10MB5978.namprd10.prod.outlook.com (2603:10b6:a03:45f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32; Fri, 7 Oct
 2022 00:57:29 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::4c38:703a:3910:61d6]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::4c38:703a:3910:61d6%4]) with mapi id 15.20.5676.039; Fri, 7 Oct 2022
 00:57:29 +0000
References: <20220927225944.2254360-1-ankur.a.arora@oracle.com>
 <20220927225944.2254360-3-ankur.a.arora@oracle.com>
 <CAHC9VhRBuBiuf6917fpP7n+Sy5fFTpzzEqRXfMGPCbnNU4jswg@mail.gmail.com>
 <8735cagcgi.fsf@oracle.com>
 <CAHC9VhTQ8HR4ZF1VNCwuFabTUU+Y+ooeDuSwNTozuWMo4RbgSw@mail.gmail.com>
User-agent: mu4e 1.4.10; emacs 27.2
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH 2/3] audit: annotate branch direction for audit_in_mask()
In-reply-to: <CAHC9VhTQ8HR4ZF1VNCwuFabTUU+Y+ooeDuSwNTozuWMo4RbgSw@mail.gmail.com>
Date: Thu, 06 Oct 2022 17:57:26 -0700
Message-ID: <875ygwbgcp.fsf@oracle.com>
X-ClientProxiedBy: MW4PR04CA0177.namprd04.prod.outlook.com
 (2603:10b6:303:85::32) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|SJ1PR10MB5978:EE_
X-MS-Office365-Filtering-Correlation-Id: c7dd7a65-140e-432a-2b6e-08daa7fee88d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: uptL3ynSSnBYlZUCUWnBnmlVzSZ+qpq6FIR/ZSc6ZLlyle/TI/kLpaRkI8eblnn2iwC1eFjMWrBKT4aIoWyXAlwq/6Q9JWQICq9agIh2UgGyuUKJS3fr2s+u993VbJqygrv7uU/COaU63O2omYLY+FP78f2TW7JQfzvjrUJYTkxne0aQj1RJ7O1errbMh/e3JF1nZ60fZlJ4yTHF2TOiWlxOeK2tZKFYs5JXqg2/Ohe2QVaTzqE/nbC+hObThd33ana82IinTCgNarQxkf7xDDf6q9NfhhiGZM6Bz9YW0jF70KP7YVdcMPd/uSD+BO650e8TDEl5QX/6fjOQk9GNoypF8OhmwLQZiiqlXHBy7o/J0stbp6/4QxiCtQNtLPGYKP8Fms9W9Dta6ZHuNeHSM1/qyaREu6spunBJeLaTgGgZXJ7rcHnqyxMCYOmpPqD/nbVxU+ZP6iXfIgyQGB3iF+SN3Gop4kJ1NaOjh97+wBFLecLwWW9YQDCGam89fu72xDqqJ2lNxAKvIE9hjiQj5OwwfPUvM9r6ADc2XRMRdoiYWWHjALf4ni8FrF8uk9RJkt0ia29zAGlmOOcLtYH9ETaooDyA0AixYLamZrMzVgRGbtNhYDcgdIWd9jV65f1sJBimrOjlTgmg4ypagiTXPsR8FKJ+7OtEdE1qCNC6XgbL4gy9h7pfWRmg57gKer1Tfy+mQLSDgUb/WIldMCxiag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR10MB5409.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199015)(26005)(38100700002)(2906002)(186003)(8936002)(83380400001)(66946007)(4326008)(316002)(66476007)(8676002)(6666004)(41300700001)(6916009)(107886003)(6506007)(5660300002)(6512007)(66556008)(53546011)(6486002)(2616005)(478600001)(36756003)(86362001);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XOD+kAXxao/mISOdjD74J5pDCWpcxNRjMsdIlca/LFkHBGhzhHWrrJrExU/l?=
 =?us-ascii?Q?nJ1QxJrMYRiAqSlWvdlaCqvQ1ri5Kti4Ynr6jWsIOYpKIpY/6NaJTs2gt8sj?=
 =?us-ascii?Q?29CckStKlqkocyOiudUOCLZklBea2hm++2j5vsdHDFaESKXrQMonp2Jco+/I?=
 =?us-ascii?Q?s55RPw5Ks0C4a6mzURfje6Sn4ATwIyMyjUjpj0yJRV1mU9mGz3m+PozFnihD?=
 =?us-ascii?Q?NWx/bWyIJb+YSpoGnNBYbjkVdYp3qkuUb0VYNZxi8PUTg6WZyP39Pno3cdNq?=
 =?us-ascii?Q?qM78tEQERiS0hHCuDxZTHkW9PuYJF0XfiIoEXQv0y11Dmq7DJ6dEAS7SO1Sn?=
 =?us-ascii?Q?K9i8cBH+1SC/HN6+oQsmeD0oNCf0wEnkZdZP++lGyozvkxrh6J3SlpbwoZ5G?=
 =?us-ascii?Q?7MsLWjEdTM+2VSkPysbfC7W4FAy9AoAnu50ViB4x8gIdLVLQN07gJ5hspLfr?=
 =?us-ascii?Q?zJZza47yaIOzr6FOVaVsM4PGgcRaj9jUik/gHa1sZJeXcCwiI7EufSL2F23Z?=
 =?us-ascii?Q?5EVmVKOlLbJ5i7B/iYLkYSIz0c1KL7iW2LU1dBqKp/ElFouAB234ZgZyfA82?=
 =?us-ascii?Q?r47IvouQ4UWvAI007iGi62GIpKaJFJm1kQa0zuYxOxTmBFXfqFrgBxIKS/Qc?=
 =?us-ascii?Q?YIzWuQ0GnBrr8lEV2kaCMS4V41w8XGvzDApAeIifYL8S85ONYu9wyGI/HL51?=
 =?us-ascii?Q?GrNBTpEHX6S2jmdZz5MnIe+qq9NR1ChrCw5sIn+LKbJYP+ZvE6r75vvosUs/?=
 =?us-ascii?Q?n9vgMvcdFHhfrIjqJAn8zjRX4khY1j45MagG8hwmqFO7zn4o/j9ffPErPyda?=
 =?us-ascii?Q?dU/gWR0GdSmjoXHOsU2x83e3qKxWecubxqTLV9S3dixxQ9T4lPnCj7J7oyrp?=
 =?us-ascii?Q?3LY9ne5rRX3fODNKaDSq0/9OnYCTr5BZb1vlo6uQqSivofjRTRf9hosblQnP?=
 =?us-ascii?Q?23pUu/t7uDb/7UDy9oZnk+zVD/bmS+9o2h/wA2U6yelMqePOL222AUtLHAIQ?=
 =?us-ascii?Q?zrxmxbDft7SV3SZinNN7qNhDOXJicfXxiEZ2lZDECJPybd/TsuybBS/iYNNH?=
 =?us-ascii?Q?AsStoKFIRuy6vetgmYMFkdQ26kZOU3ki+ABKaUyDITvyEVjEcztSZzcCm1TL?=
 =?us-ascii?Q?MBHlxSj1+Tm6OzHnacvfr5tmbMvoW818v1dVopUTXqGC3/gMQG8XvNvtBRsi?=
 =?us-ascii?Q?Uy7zrVx7mXGFk6m5AHL9lPOqYF7XKln/95/aRCBgZtitqvyQK9OfGRpMKCSP?=
 =?us-ascii?Q?sDUUXGUk+b0CYiRXuxez8Ev/nfM3iDbvYOiqm1qG9MWx0EdvC9ckIcwpdNg/?=
 =?us-ascii?Q?GHCgAl7kQHwvMLTrAMua4MiJOy+1j7bFOVHf7oy217qUL+HEtDj0ftFiP6bn?=
 =?us-ascii?Q?wJm44pE16hyysX3m2qnE208+WqdEIdTE0e8RfHmPPvQMwRoGr1c/TVVPrge3?=
 =?us-ascii?Q?Io0PuzZoKFUkLFlqiRhtezmp53q50Pvl8aRuTzCw1aCdJHISIzDnbwIMGYK+?=
 =?us-ascii?Q?FniT6S7pFp+5mvL0iPItgx8nQIFBrE5pevYmaqFiT8b5gjfhFvWP1TkeEHd/?=
 =?us-ascii?Q?DoyeF1/nIt8V/Z0PuO3cf3LOJeShX0MBYyXTteGYyJ1rdacRZQuFbIAuIvrN?=
 =?us-ascii?Q?qQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: eKd/nppAg5aj4mzr6Of3F36+sOLZ+jvuoBu7yFArwigLTi5lwGi8DFvuSbK8lUdcQW3Pp43PF4ngfKu8OEhsF9cLq34QvTVkRDNabFwMp0lbX8EIcP0AzDV7yvfAw8Guwhmv4q68qYm7IDDjf4EcHAcgOgIimexIvr1uEmRap5NAJ3u+hfBkLDUWU82vnJWLx3+B5RUb/K67NFe55G6eeOEdD65k3GUsHFuqPwhbHaFWhFRf9anwOuu3LFEhmf0NmN7kFG4W610BNvPJlkgZfDaND/mbuANkvFx07zAilj1E7Vxdn0ytaVNoukws+ZUsJUUkJLTMJs+kZY3ac1WQyQJ72dMWkBm3WouHH6+nhpnh2g0t1pez/1jmTtjo703mKPT+OwLRV/mLM1VnqolVdRywaIqmNON81c0MCgvjdtfO/nV76vbznxBuTczQ/tT0haEkoVyUGJa1zKWsmvDQRAiKSKE4pianD2+EPaorJReSq4lOKRUlK9DSQvicidDsLG/TGQ2e9t24rsFmyIXA4dhG5xS5km2/aehWSAMaiGTLQrx9VwA/pQkFsavaUcnQanduEPhbnfcWA8WSaRK/bHcWflSTxfo7jYzIE24ta+jbbff55SlH9cdZwIM6P7B/fCwqwoSp4D5cOlaEE804ulC3ivv5IoTncOg6RoQsFYhv3DxjM2cfiUFyKy1RqAKarw0cyiJhEHYc866JKa4gzP4spEFdi7Dizm7DgbdqezZ4MHL/Aa0e2Llyy++oXiFTdXO2ewfm+7EKxSd/AExKln4D7Ymb/4V5Oyf8HaNYTicBgvffKgDCDaxHUV6xX1zzDTuuFXFqgAMQs5qG/8IG0Q3S99VnU4Ynom+fRVnS0Ho=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7dd7a65-140e-432a-2b6e-08daa7fee88d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2022 00:57:29.4880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hVObfGve+ufvdAlxlnXx8eknRS8GHz8Pv325dJrzT20UxPYYw4Zwg09XC8t9ZL3jwVZw21LNjkJxq46PYyxI0VndkMAe8IZDXPK5UKjqCTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB5978
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_05,2022-10-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210070004
X-Proofpoint-ORIG-GUID: 1W54SZmnDF3BcMV11mf0Q19CY1Pb_Sys
X-Proofpoint-GUID: 1W54SZmnDF3BcMV11mf0Q19CY1Pb_Sys
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
Cc: konrad.wilk@oracle.com, linux-kernel@vger.kernel.org, eparis@redhat.com,
 linux-audit@redhat.com, boris.ostrovsky@oracle.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Paul Moore <paul@paul-moore.com> writes:

> On Thu, Sep 29, 2022 at 4:20 PM Ankur Arora <ankur.a.arora@oracle.com> wrote:
>> Paul Moore <paul@paul-moore.com> writes:
>> > I generally dislike merging likely()/unlikely() additions to code
>> > paths that can have varying levels of performance depending on runtime
>> > configuration.
>>
>> I think that's fair, and in this particular case the benchmark is quite
>> contrived.
>>
>> But, just to elaborate a bit more on why that unlikely() clause made
>> sense to me: it seems to me that audit typically would be triggered for
>> control syscalls and the ratio between control and non-control ones
>> would be fairly lopsided.
>
> I understand, and there is definitely some precedence in the audit
> code for using likely()/unlikely() in a manner similar as you
> described, but I'll refer to my previous comments - it's not something
> I like.  As a general rule, aside from the unlikely() calls in the
> audit wrappers present in include/linux/audit.h I would suggest not
> adding any new likely()/unlikely() calls.
>
>> Let me see if I can rewrite the conditional in a different way to get a
>> similar effect but I suspect that might be even more compiler dependent.
>
> I am okay with ordering conditionals to make the common case the
> short-circuit case.

So I played around with a bunch of different combinations of the
conditionals but nothing really improved the code all that much.

Just sent out v2 dropping the unlikely() clause.


Thanks
Ankur

>
>> Also, let me run the audit-testsuite this time. Is there a good test
>> there that you would recommend that might serve as a more representative
>> workload?
>
> Probably not.  The audit-testsuite is intended to be a quick, easy to
> run regression test that can be used by developers to help reduce
> audit breakage.  It is not representative of any particular workload,
> and is definitely not comprehensive (it is woefully lacking in several
> areas unfortunately).


--
ankur

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

