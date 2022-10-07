Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 180FF5F7263
	for <lists+linux-audit@lfdr.de>; Fri,  7 Oct 2022 02:55:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665104128;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=H5ldKUXLYzJBnOxnn4IX9l8N2/We9QnqFNcbmnvpF9g=;
	b=K+zgT3NXQhOSRctocAuX24gUvhiTc8Iamj8KkfimbGoVE6Y6SRI0jBhvbDeejS2Kr+gCxz
	hB/bcYJFpYM4H27L1SiEbVa9w4JAr2OLOaksSkQt5DC5PlhObuRGUVBjTW0sdk3xz36tiz
	x7Q+6VPxFllfacdc3+7TlMgPbqt3DLw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-983OiyHmPzG94OfUqAwoOw-1; Thu, 06 Oct 2022 20:55:24 -0400
X-MC-Unique: 983OiyHmPzG94OfUqAwoOw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AEF2C101A52A;
	Fri,  7 Oct 2022 00:55:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1F09E145BA44;
	Fri,  7 Oct 2022 00:55:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 966651946A69;
	Fri,  7 Oct 2022 00:55:21 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0E1A41946588 for <linux-audit@listman.corp.redhat.com>;
 Fri,  7 Oct 2022 00:55:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DFB7D20290A6; Fri,  7 Oct 2022 00:55:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D6C3020290A5
 for <linux-audit@redhat.com>; Fri,  7 Oct 2022 00:55:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF80229AB3E7
 for <linux-audit@redhat.com>; Fri,  7 Oct 2022 00:55:19 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-pcmtXefcNhKCmdlJJXVHsA-1; Thu, 06 Oct 2022 20:55:16 -0400
X-MC-Unique: pcmtXefcNhKCmdlJJXVHsA-1
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 296Nx7M9016410;
 Fri, 7 Oct 2022 00:55:15 GMT
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k15up5522-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Oct 2022 00:55:14 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 296NsQ9x028251; Fri, 7 Oct 2022 00:55:13 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3jxc06t2kj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Oct 2022 00:55:13 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by SA1PR10MB5784.namprd10.prod.outlook.com (2603:10b6:806:23f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32; Fri, 7 Oct
 2022 00:55:10 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::4c38:703a:3910:61d6]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::4c38:703a:3910:61d6%4]) with mapi id 15.20.5676.039; Fri, 7 Oct 2022
 00:55:10 +0000
References: <20220927225944.2254360-1-ankur.a.arora@oracle.com>
 <20220927225944.2254360-2-ankur.a.arora@oracle.com>
 <8171459.NyiUUSuA9g@x2>
User-agent: mu4e 1.4.10; emacs 27.2
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Steve Grubb <sgrubb@redhat.com>
Subject: Re: [PATCH 1/3] audit: cache ctx->major in audit_filter_syscall()
In-reply-to: <8171459.NyiUUSuA9g@x2>
Date: Thu, 06 Oct 2022 17:55:06 -0700
Message-ID: <87a668bggl.fsf@oracle.com>
X-ClientProxiedBy: DS7PR03CA0131.namprd03.prod.outlook.com
 (2603:10b6:5:3b4::16) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|SA1PR10MB5784:EE_
X-MS-Office365-Filtering-Correlation-Id: bf7eb5f7-979a-4985-9d1d-08daa7fe9560
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: t0FkWG5l3NhWKQYS+z1GArqtKIoFy2gVcMUK/zw7GiHBoym4e8FzUoWnHnBMABMh6L7GGa9imjOVDzoXP9Z6utRRmgUAAbZs1+oh1nFICGaFnaR6iXKzkCDu/AMtxSVPZ7xht6xP74HRVB8QXT+ILXTfEq/gJLW7Pz8p7oy5rkoXxhAvTtzSYb37SZ9x8n22cP6X8LVFCGpPRD9N0rY8sn9iZyx+omqsfTLBRqLmFC8quV5LlIrZQdELCo4VQmYKPEwvCplKQDTQdl7sg2Ad9Sreiy18Xfekr+pwuP9GRlSoi53TtiNUHdWlJAmFC2Lc6azmzjmqgAlXY8xTNe2PTzRk1oYVDCyn8PkAx+uKpKpYJV69bjVJaCszsRFddd+uIAwacVBwW9YHmtPGHFRvIldIEDcqduWrJHJqXebOkzYGv/iJkvVfZAPcC7UOpivv6vISWXF9nKfrrgO9ZxEiBEgGc8PvQ38PrMH7kiWRbn1nxwnwzi62loaKGVrD+pT3Gs5TkXJ24OOrZbp0L5CxSWpacYwOQi4yJHXv+zC2y/LOzutspyZ0ds5Les6Xdr3SC/mbRRUIYur0AyVRVdcVqgHgEIwaK5bTYx8+DtF4ofmnZBx7Z2y0SFxqMDVv9oTyi1BqJ+5Fpmn+rJDEKT75qY0DL+TI/E694LAH4N8m6NGCZW947hz1N+l5IyYsNZ7K7OrwGRXy11TWuhRJ5E4ZAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR10MB5409.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(39860400002)(136003)(376002)(396003)(366004)(451199015)(36756003)(2616005)(86362001)(4326008)(38100700002)(2906002)(83380400001)(186003)(6506007)(6512007)(53546011)(26005)(107886003)(6666004)(6486002)(478600001)(66476007)(6916009)(66946007)(66556008)(8676002)(41300700001)(8936002)(316002)(5660300002);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9NAieNCZd7NGijx7xyILc0W2SQVXOk+lC525D3Xp/Thnq0abKqkrtIDJrnWM?=
 =?us-ascii?Q?pv8QL8FIDnTswUPtpu4YgeR/+Os/D2jlvO8ouULa3VNTNUrPChF1y/3rTBmJ?=
 =?us-ascii?Q?6DxOXqrVWlWgC/dPpmOyWpXoGDGSk1bQ2U5n3T9uA/tAKPvdv7aVx60AwDNi?=
 =?us-ascii?Q?EXPKmIhR9titDsUbfB+sB66Mtd9eFbaP6IxINmP/3CkM0l5V0TGgNZhFkNXr?=
 =?us-ascii?Q?wWNLVDJTuvcb3BtsABMdXeR2oGjUaXdXjHn4urYTiVAJH1eI2adVrbsicuH3?=
 =?us-ascii?Q?GTDMUwPfUP0wIK731XagWE9n0AQ8GRHrUWLxoHOquroXSJNoMJ8gAuJ3Vev7?=
 =?us-ascii?Q?gjH+uhq4uI4vs//N2T51GzTN2/HkuKxWjvbdOE31oOATJAUP60yV9a5BNspK?=
 =?us-ascii?Q?/VothnPb2f0EYSwmlkt4s/a+bMoJTdrlFHNWjd5obreDRO0+gdkbewujgkHE?=
 =?us-ascii?Q?rXkJmfsSBbrC7Iz004HhMpD+G84y3bOiXZwsB5/aMib1UPL7rrM4AKSyCxR8?=
 =?us-ascii?Q?I8kIH3vUqeSiWsUcbzlNEodXlIDx4moljsVT6xD5qui3YOfHdPsv8j0sPCnl?=
 =?us-ascii?Q?0TIkqEmO7a28c8HRJyqyCYkQGWvxf2VXNlXKMIoUFgWIzgQKjfh1sKxCdpIK?=
 =?us-ascii?Q?CG+UkNMbgTMmfUl7bxxbjQ0VvIb659R2oLBbmHMAVVA7ZY6oAQ1MVk5DecR1?=
 =?us-ascii?Q?d1PZC0nkOUGQU0y4k9EW+hZB3AHGdHPj4SdtT8TKwiJgdgGabF4mBFwi0tUV?=
 =?us-ascii?Q?SD5cGPM0sCWZhZTy5U5n8Y6VtWyQxOeiGOdE06SSkDhyvkd7ODtwyBRyH463?=
 =?us-ascii?Q?c28NJ5SFzmGCF71VCXPTz8H0ikpeEaFeWMqg+5P35BTzMhOYLvjPRmhSDSOB?=
 =?us-ascii?Q?737fX0exsksuLetHev24zd/nc9tp7IOaYNyl8e6ArEe5Kso9bPRRMfwlxPqX?=
 =?us-ascii?Q?phG7vj0roIr/yOzBx5Dxq21QHpbcWued1AxNgvglIun437Stsr4rqYns20iN?=
 =?us-ascii?Q?YALQo7zTSiCrTC/qY+3OxTYLVrod5xBxfuNTAMRdVkDf82ZN7wF/iZlTa46y?=
 =?us-ascii?Q?9lEq1U9zk2cL/8XlWVJnHM/2hri59J9MnZHCtA6ePI07lBOkwPZx8cCsjHb9?=
 =?us-ascii?Q?wNWjHL0EyJjrOhbgW5Q/XqMj3Sg+CuXLTjv7M5KbhVi6u1pHoyVkypAFKXi0?=
 =?us-ascii?Q?A4RWsXc2LgCvCKSVZOFgifuL3V/Z9IrAk1PV4cGSLrxCKgOBYDVgwRlUgkIO?=
 =?us-ascii?Q?8U/RvgHl475Xdwz/85Gma7IRNbIknrKdSVrc4bQMdYKXKIUsJT8ljja8EZQn?=
 =?us-ascii?Q?GY946pmW3MBTz4YA5zSA25NWrYrS2QOSJq/0ON8hssQaeLfSLMIkmvm8CF6w?=
 =?us-ascii?Q?EPDfZH4Gzy2BqY25fn9hEDPCXDu10y8Q1AanGRbTxV3HzNvmF0K7/jkZqw6+?=
 =?us-ascii?Q?qxkL4k9HAC0trkIazx4FY7Y50d1UiP+/SFTWCZZUYxyfhrb7wzMiNeYSJRD0?=
 =?us-ascii?Q?Fz0W+gElp9o1khsDtCoSFYD7iA+riCSmHYgPvALRHYURDdU/cX6sLH8/jx4W?=
 =?us-ascii?Q?HPrC4+tFERWIO/Jw2bpzoU7XKJPMBCrXZVqW4uHyjG9+KNaxsBWmhroWigl2?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: ugrs2wo3o0A/TSC1E5yARZMjvDdVJOzILkdegTQZ6C1yAUEjHtj2Qh2Lfgq2SbbocMthPuyab7hlWwpf1/76cnFByOhX48Bs92AuYDuaEhVGNpX4xWqrlBluDqNaGi0q84yc3oE77s0/Yy4Vtqy5pYdwgyYNikvd316BumHDjnnB05ItaMn9hHbmU2ruJRNlJyfszIE0SgMWu3nJ4mzdupMCcDh1W3fhZt4/hhoULT02Ys/oG1N+YVUEY0l+5bsNFZhoLo8wBlzFeM/mNQOKkYA1e+pZUiNA/OOii/EmBa14Dd0lgPClB6ptqxGpkkd5qcbu5iJpSydF+GCSyYc1gb59yzmPRdts3/qxDN6AoIjchYxNyoDnaWz1CsYdTjFdNZAqdS4KNT11poeGCPe7cZM8vr5Ha8HKilOFL4ZOd/Bt09iR1nyQst1Z6APDucP3GVIphVAji+UQEaLRcSgTgeaubou3CzOKuiJ23p0xao3gPPTfTqAlsozQvl3XCb7YOwSo/tzp5Oem/qlKu2ZviYk37s28rznQg7+ZPtflPDUOBwYZiseiPYUuKYiEE0wAXTsv7rNOO+ks4XnNnv9RwvrExltDTJ9ar7F3oUf9MtDe8u8QK7CrPJp7YM190u3n8PEGZUW3ypjLIautebLgSzKOluR/H9L7Mug2P/5lefznWPefDRXYK6hvOj6wZ+zC1D4SQs9HoSXyJTJ8ue1IYDlTRB1kIFhOw5J/bbSUxWlGYYaI6+6Y/Rb/AzHA56sfn5ejLq2PTHHO7olHmmXklVfid1581WnJEdo7JqO8Drc02qvYfKmQN+mlU+tEjvmbO5FIZ7tP+2FLCmk3c4SWoczMrVxREtAS35IZRQfkivs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf7eb5f7-979a-4985-9d1d-08daa7fe9560
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2022 00:55:10.6638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Os4HAJgaq9RTJJ3N+eC2MK7T2//KwFnd5qmuVJ7yZsm9/5E2n1syr4JEsMBULCnr4ntv5z4QUb2fU9rAHrAtzj0f2ymgVIqTndcJTO7eW7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5784
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_05,2022-10-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 mlxlogscore=999
 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210070004
X-Proofpoint-GUID: kAo4qKK7GjJSzm0cBLOYt0wf4Y8TS56q
X-Proofpoint-ORIG-GUID: kAo4qKK7GjJSzm0cBLOYt0wf4Y8TS56q
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
Cc: konrad.wilk@oracle.com, linux-kernel@vger.kernel.org,
 linux-audit@redhat.com, eparis@redhat.com, boris.ostrovsky@oracle.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Steve Grubb <sgrubb@redhat.com> writes:

> Hello,
>
> Thanks for the detailed notes on this investigation. It really is  a lot of
> good information backing this up. However, there will come a day when someone
> sees this "major = ctx->major" and they will send a patch to "fix" this
> unnecessary assignment. If you are sending a V2 of this set, I would suggest
> adding some comment in the code that this is for a performance improvement
> and to see the commit message for additional info.

Thanks for the comment. Just sent out v2 of the last patch which
addresses this tangentially -- it adds a separate function parameter
for ctx->major/uring_op, so this shouldn't be an issue anymore.

Thanks
Ankur

>
> Thanks,
> -Steve
>
> On Tuesday, September 27, 2022 6:59:42 PM EDT Ankur Arora wrote:
>> ctx->major contains the current syscall number. This is, of course, a
>> constant for the duration of the syscall. Unfortunately, GCC's alias
>> analysis cannot prove that it is not modified via a pointer in the
>> audit_filter_syscall() loop, and so always loads it from memory.
>>
>> In and of itself the load isn't very expensive (ops dependent on the
>> ctx->major load are only used to determine the direction of control flow
>> and have short dependence chains and, in any case the related branches
>> get predicted perfectly in the fastpath) but still cache ctx->major
>> in a local for two reasons:
>>
>> * ctx->major is in the first cacheline of struct audit_context and has
>>   similar alignment as audit_entry::list audit_entry. For cases
>>   with a lot of audit rules, doing this reduces one source of contention
>>   from a potentially busy cache-set.
>>
>> * audit_in_mask() (called in the hot loop in audit_filter_syscall())
>>   does cast manipulation and error checking on ctx->major:
>>
>>      audit_in_mask(const struct audit_krule *rule, unsigned long val):
>>              if (val > 0xffffffff)
>>                      return false;
>>
>>              word = AUDIT_WORD(val);
>>              if (word >= AUDIT_BITMASK_SIZE)
>>                      return false;
>>
>>              bit = AUDIT_BIT(val);
>>
>>              return rule->mask[word] & bit;
>>
>>   The clauses related to the rule need to be evaluated in the loop, but
>>   the rest is unnecessarily re-evaluated for every loop iteration.
>>   (Note, however, that most of these are cheap ALU ops and the branches
>>    are perfectly predicted. However, see discussion on cycles
>>    improvement below for more on why it is still worth hoisting.)
>>
>> On a Skylakex system change in getpid() latency (aggregated over
>> 12 boot cycles):
>>
>>              Min     Mean  Median     Max       pstdev
>>             (ns)     (ns)    (ns)    (ns)
>>
>>  -        201.30   216.14  216.22  228.46      (+- 1.45%)
>>  +        196.63   207.86  206.60  230.98      (+- 3.92%)
>>
>> Performance counter stats for 'bin/getpid' (3 runs) go from:
>>     cycles               836.89  (  +-   .80% )
>>     instructions        2000.19  (  +-   .03% )
>>     IPC                    2.39  (  +-   .83% )
>>     branches             430.14  (  +-   .03% )
>>     branch-misses          1.48  (  +-  3.37% )
>>     L1-dcache-loads      471.11  (  +-   .05% )
>>     L1-dcache-load-misses  7.62  (  +- 46.98% )
>>
>>  to:
>>     cycles               805.58  (  +-  4.11% )
>>     instructions        1654.11  (  +-   .05% )
>>     IPC                    2.06  (  +-  3.39% )
>>     branches             430.02  (  +-   .05% )
>>     branch-misses          1.55  (  +-  7.09% )
>>     L1-dcache-loads      440.01  (  +-   .09% )
>>     L1-dcache-load-misses  9.05  (  +- 74.03% )
>>
>> (Both aggregated over 12 boot cycles.)
>>
>> instructions: we reduce around 8 instructions/iteration because some of
>> the computation is now hoisted out of the loop (branch count does not
>> change because GCC, for reasons unclear, only hoists the computations
>> while keeping the basic-blocks.)
>>
>> cycles: improve by about 5% (in aggregate and looking at individual run
>> numbers.) This is likely because we now waste fewer pipeline resources
>> on unnecessary instructions which allows the control flow to
>> speculatively execute further ahead shortening the execution of the loop
>> a little. The final gating factor on the performance of this loop
>> remains the long dependence chain due to the linked-list load.
>>
>> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
>> ---
>>  kernel/auditsc.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
>> index 79a5da1bc5bb..533b087c3c02 100644
>> --- a/kernel/auditsc.c
>> +++ b/kernel/auditsc.c
>> @@ -843,13 +843,14 @@ static void audit_filter_syscall(struct task_struct
>> *tsk, {
>>  	struct audit_entry *e;
>>  	enum audit_state state;
>> +	unsigned long major = ctx->major;
>>
>>  	if (auditd_test_task(tsk))
>>  		return;
>>
>>  	rcu_read_lock();
>>  	list_for_each_entry_rcu(e, &audit_filter_list[AUDIT_FILTER_EXIT],
> list) {
>> -		if (audit_in_mask(&e->rule, ctx->major) &&
>> +		if (audit_in_mask(&e->rule, major) &&
>>  		    audit_filter_rules(tsk, &e->rule, ctx, NULL,
>>  				       &state, false)) {
>>  			rcu_read_unlock();


--
ankur

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

