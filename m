Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8355C5F0C44
	for <lists+linux-audit@lfdr.de>; Fri, 30 Sep 2022 15:14:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664543676;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZVZXtlMdcgyXpn6Hxk2GqDk2FGtVDxs53Vh4EQviEbE=;
	b=M8qcCvAEoWCHcTTViUaIQPAa1/MtclVVYuIE1tgw91NdKMZEZqUE4GcBnUJj0mVR1J2H+N
	jK1DL92cfHVwxhl2FxHnWgzhoSPqNiuscFdTOH5JHaUiGIfnxs52dXFb8gy5iKYPNmHPAh
	Y0OYnFbpVdtwVbjthAN/4T2cLIggb9c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-52DWZpPtNaCI71uu--9sxw-1; Fri, 30 Sep 2022 09:14:34 -0400
X-MC-Unique: 52DWZpPtNaCI71uu--9sxw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 225FE185A7AE;
	Fri, 30 Sep 2022 13:14:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AF6272166B26;
	Fri, 30 Sep 2022 13:14:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B68011947047;
	Fri, 30 Sep 2022 13:14:23 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E2E5C1946A4E for <linux-audit@listman.corp.redhat.com>;
 Thu, 29 Sep 2022 20:20:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B1FAE40C6EC4; Thu, 29 Sep 2022 20:20:52 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A9A3040C6EC2
 for <linux-audit@redhat.com>; Thu, 29 Sep 2022 20:20:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 886FC3C01DA2
 for <linux-audit@redhat.com>; Thu, 29 Sep 2022 20:20:52 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-sfndxvZJNXSzxnLfbec61A-1; Thu, 29 Sep 2022 16:20:48 -0400
X-MC-Unique: sfndxvZJNXSzxnLfbec61A-1
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28TKKhUE011307;
 Thu, 29 Sep 2022 20:20:47 GMT
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jsstpwd9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Sep 2022 20:20:47 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 28THOnH2036986; Thu, 29 Sep 2022 20:20:46 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3jtpvh00p2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Sep 2022 20:20:46 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by MN0PR10MB6005.namprd10.prod.outlook.com (2603:10b6:208:3cb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Thu, 29 Sep
 2022 20:20:44 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::4c38:703a:3910:61d6]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::4c38:703a:3910:61d6%4]) with mapi id 15.20.5676.022; Thu, 29 Sep 2022
 20:20:44 +0000
References: <20220927225944.2254360-1-ankur.a.arora@oracle.com>
 <20220927225944.2254360-2-ankur.a.arora@oracle.com>
 <CAHC9VhRZzU5-+65AFOK826rA0xo-nbgRK_pP05Q_zjvAQvLnRw@mail.gmail.com>
User-agent: mu4e 1.4.10; emacs 27.2
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH 1/3] audit: cache ctx->major in audit_filter_syscall()
In-reply-to: <CAHC9VhRZzU5-+65AFOK826rA0xo-nbgRK_pP05Q_zjvAQvLnRw@mail.gmail.com>
Date: Thu, 29 Sep 2022 13:20:40 -0700
Message-ID: <87tu4qexuv.fsf@oracle.com>
X-ClientProxiedBy: MW4PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:303:8f::24) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|MN0PR10MB6005:EE_
X-MS-Office365-Filtering-Correlation-Id: 059a4c84-8ba2-4f48-430d-08daa25815eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: iH5qzigty8Nm/f9cLNzQdtsDQaLEh9iG/VgEBGeuPot/ayNdEX9iMmK9k3lXxQWVA7FnIA+FCY7pmZ9Eqmh4Z5ujddL72SUeNYgqfZgmxQHHIfIH9ZxbaYNxAGm8C92KmW7TGpxyYmQ5V/BfENeKzITrW2asqGVQjnRKQ3Y4H6gAy+64lPovQlpwGTx46woiVEZ4EWWvSjqAn9el21PShlcx6yzSKl9aEtrX6j3zUtYZr9nbmLpVV+RcpbWodvLLcYbV9soDHZTZYFsNe+96CPPss6pc0FR6JkrDqofGQsLig5w6chE29EOK69PwsPbPkmRnjjCCS992FfKkKfIjGik4aT4RSOnhla2obGgvjYZcHnn4YnaD07o032k1Ji/umZPKPEsY9shLnZvUQw295xegM9lEzP2UKNmVTl9sFn3an0jv2WmdRH42Y1/sZ0S4JvUTrWg2BJa1YXEnFpa0RErWQSQEdnUM3TFdKoXiER1/6K6apfczomn0ViJU9RDsE+14V2iam+fAd4Tf7iDEVV6K4F/h5ZMLCTDv1triyt/kV+iHCQE+qOyAzbtcUeHAN0t0JmNx+AeRi8CTDGUUMBoPBExn81FNZIf7tLP63DJoL9Mso4Dg2ZFFHq9ZLTViSfOM7S3EDFn003Pc+J++s3fDmAEeF2f1QhDfRxH5tltW0/52g4qutG36v3ujQGgoxkEoazKMi38+Ln56p/S9VQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR10MB5409.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(136003)(396003)(376002)(39860400002)(366004)(451199015)(8936002)(5660300002)(83380400001)(53546011)(36756003)(6506007)(6666004)(107886003)(41300700001)(6486002)(6916009)(478600001)(2906002)(186003)(4326008)(66946007)(66476007)(66556008)(8676002)(2616005)(26005)(6512007)(316002)(86362001)(38100700002);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TkjQH8772lg6uEYcyPf6HC2mWL7Cy1VaLNxiTSro/j0YaGb9wKc+nHcVEq3b?=
 =?us-ascii?Q?csHdlhYTfkzK45vbYQiTUPvb8PRJEjtXl6n8rUWB45YlJAAnjA3Y5MafiqRq?=
 =?us-ascii?Q?JirSwBkPs6/ujf7zkAKwblEjoDrAgp+gr1w8/bUWzneuyLPWXirIT7Zy3gIQ?=
 =?us-ascii?Q?AkIrbNxuR0V0nsp9QLWOZxy9ZxlUrDZ8vPxreH0GeY6RMTZRI8sElMJDe4i9?=
 =?us-ascii?Q?pI7OVhAZOW1ml1j9a3Npz/mA/3qi4GK578MbiW+348Tt+SCzUuuPhzNldDoy?=
 =?us-ascii?Q?oDrZ+6Kxs0gGg1+NtSHSXf8taByxlxCitqKAM6vgeCvwu6r5M846dm1XWUjR?=
 =?us-ascii?Q?Zr8Ra1vJgIWD6Kdv6ceRPJuyqQEXC48I7mG1hujxDx0FhzJc3BlHhjcQoMSd?=
 =?us-ascii?Q?5PPhqD5QuJRVt9FkAykhVc1aCGanWnUHoPCGFMUBfbF93iNYmhMzI3qBDSie?=
 =?us-ascii?Q?E4FI10OQcXR/fvrNI0xAT31XrKX800VpuVggBCOwwzDT9zu8vemuzxS9qruQ?=
 =?us-ascii?Q?xNX0MWa/673P4/avzYKOXmNxL8e+mFP/WiwgPgtjQIlxCWfueA0o6/J0TTtN?=
 =?us-ascii?Q?dohhmGTHbp/o4X9+IoO/GtcTu5L4TJ4+TvLL43KMYqNZ0VonOs1GZX0pTtwc?=
 =?us-ascii?Q?IkTVB9mixE3pKj3rjQcY/VYevXVbMY7ijeBkK9IJKCpdf1t0iIDYqSgmdfih?=
 =?us-ascii?Q?2esuHs1rHbjMpCQz9vKiaBTOIPHhujsH/NagcY4C2EJXElcKjjcYEnOYaibE?=
 =?us-ascii?Q?tVcAVVgDisghFw5EAVXeOxlL7Ery7ftE7FJMNrs5x0jrCSMpz2Pj7lxiP/iN?=
 =?us-ascii?Q?060XnZONw/aXm4uUpI3yg0Of1EXF70uXvbuE7f457D3IBqX5rcYVnbPOT5jg?=
 =?us-ascii?Q?cV+Gpyz/XVDlhYAWkveyWUyxoypR1hf52VgIWnxInADYzSzWTuBylebFiU9m?=
 =?us-ascii?Q?4ZncYYwx6qYRdRyXBH+yb3ZF+yd6cQCWS1YSxn2DpfQTmOMImb/zeFZesFYk?=
 =?us-ascii?Q?YtOD5mPQvgjW+/ZD8c8EnxbJSMtRGsstxnl+0aUdmcpMp83U9uSk1BWnomml?=
 =?us-ascii?Q?StJiJ8BG3pEKcDYXFON4iGhPtUrDveTSuq8WacG6u7e5mZiHtJX0fDAiu4lY?=
 =?us-ascii?Q?eQMkI6hIFsEphIDCqgZr++gfurXoKmj1jB/iLf1enbNH7y3QYJ4wlSUV5lOx?=
 =?us-ascii?Q?WgG4/dB8ghmAkBsAHFTf2yqzs+uh7R1z8ZHLm3/1hSG6ImHVPDIUO4sU/fOu?=
 =?us-ascii?Q?23gnZ9oF+dU7uhNLPAtUR0HpJgUbZQaLN/oKcqV4rnsqQj9rqEaPPrUUgtgX?=
 =?us-ascii?Q?ZwUFjzlKKgToQ3SUEQ/vzyNP8fvODZ7ClJfORpO/1nWDxPLnufnDq5LwxndP?=
 =?us-ascii?Q?L/o5RWGc78Rg2k7sKVg5qSVFUENbUojkVk7eJygjeBLkQHo/kmGcgKMjG860?=
 =?us-ascii?Q?zCUx84eNW42WQMQ2i3ll2MFEWgVXQ7uul47Ye+VIUmLsqBu4lFYtrf/e/n18?=
 =?us-ascii?Q?Hfw+15APSyBM64+4hA2Zr8pPQpHTbVe4RTx1+B/Y2CruUWOd2pR5H/Nz7fBm?=
 =?us-ascii?Q?R+nSkzwAoEZ/yxIEDyhJ2uEOkRTPZ1HW3mq8+B5IvBe+Da+ocHi1KHIJPHNm?=
 =?us-ascii?Q?Wg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 059a4c84-8ba2-4f48-430d-08daa25815eb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 20:20:43.9440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9JXm2nSwIoa0Cda4d6VDpyzH+X+xDri5gRBF9Oz+Jyi2f8wJLwJDPwEvoxRFVEzm3CxsEk+TNbtXwQjU+DHLlWbjJyi7Mvy1rxi9vN+z7TI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB6005
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-29_11,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 suspectscore=0 adultscore=0 mlxscore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209290128
X-Proofpoint-ORIG-GUID: jTmFSmFtC6OtFEcAuzF-TV0ccqqaY43O
X-Proofpoint-GUID: jTmFSmFtC6OtFEcAuzF-TV0ccqqaY43O
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mailman-Approved-At: Fri, 30 Sep 2022 13:14:22 +0000
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
 linux-audit@redhat.com, Ankur Arora <ankur.a.arora@oracle.com>,
 boris.ostrovsky@oracle.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Paul Moore <paul@paul-moore.com> writes:

> On Tue, Sep 27, 2022 at 6:59 PM Ankur Arora <ankur.a.arora@oracle.com> wrote:
>>
>> ctx->major contains the current syscall number. This is, of course, a
>> constant for the duration of the syscall. Unfortunately, GCC's alias
>> analysis cannot prove that it is not modified via a pointer in the
>> audit_filter_syscall() loop, and so always loads it from memory.
>>
>> ...
>>
>> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
>> ---
>>  kernel/auditsc.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> This looks pretty trivial to me, but it's too late in the current -rc
> cycle for this to be merged, I'll queue it up for after the upcoming
> merge window closes.  Thanks.

Thanks.

Ankur

>
>> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
>> index 79a5da1bc5bb..533b087c3c02 100644
>> --- a/kernel/auditsc.c
>> +++ b/kernel/auditsc.c
>> @@ -843,13 +843,14 @@ static void audit_filter_syscall(struct task_struct *tsk,
>>  {
>>         struct audit_entry *e;
>>         enum audit_state state;
>> +       unsigned long major = ctx->major;
>>
>>         if (auditd_test_task(tsk))
>>                 return;
>>
>>         rcu_read_lock();
>>         list_for_each_entry_rcu(e, &audit_filter_list[AUDIT_FILTER_EXIT], list) {
>> -               if (audit_in_mask(&e->rule, ctx->major) &&
>> +               if (audit_in_mask(&e->rule, major) &&
>>                     audit_filter_rules(tsk, &e->rule, ctx, NULL,
>>                                        &state, false)) {
>>                         rcu_read_unlock();
>> --
>> 2.31.1


--
ankur

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

