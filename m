Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 2FDD9231663
	for <lists+linux-audit@lfdr.de>; Wed, 29 Jul 2020 01:42:38 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-Pdk-emszNPq72y9ABS3oWQ-1; Tue, 28 Jul 2020 19:42:35 -0400
X-MC-Unique: Pdk-emszNPq72y9ABS3oWQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 958F98015CE;
	Tue, 28 Jul 2020 23:42:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9440410013C4;
	Tue, 28 Jul 2020 23:42:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 50B87A359F;
	Tue, 28 Jul 2020 23:42:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06SNgAWq004087 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 28 Jul 2020 19:42:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9760E2026D67; Tue, 28 Jul 2020 23:42:10 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8377A2026D5D
	for <linux-audit@redhat.com>; Tue, 28 Jul 2020 23:42:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B2C28007A4
	for <linux-audit@redhat.com>; Tue, 28 Jul 2020 23:42:07 +0000 (UTC)
Received: from sonic314-27.consmr.mail.ne1.yahoo.com
	(sonic314-27.consmr.mail.ne1.yahoo.com [66.163.189.153]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-273-ERDymbKpNzCtVIJrhZHYkw-1;
	Tue, 28 Jul 2020 19:42:05 -0400
X-MC-Unique: ERDymbKpNzCtVIJrhZHYkw-1
X-YMail-OSG: h260Wr8VM1lhSDZiLfvkvM0OlUi0zst4DsT4LWHe1R3IXk2QobD6iNo8XR.8wqv
	hPjihA1A_w6O8KLM1Elv.jjfvqlCErNdGZJQZ84Ruh7hPv2BrfiAmGdO1WRbSID8ziiNOD2_Bv5k
	NTdHDnKFc5FYfW0l.rc69yRwE3I4oo7mr392kFMMtQn_TqUjvL9hk4sxAMawee74V3uDPgxndyH9
	APMTUbFM2wAsG8mjE58EJZNI2NwacRCJQhVpXzxO4of_6S2rceFpFevQHrhYgsgdDCsf_JkVupxQ
	o320yaGNDx0JmNz9_VJttG539eJ5dSvNb_yTcJD_k0mo_kwIHL1Hjvuw6IkdAzplDv1VdXV9jkQg
	K19a6BWlToID5yfAq0kNGkAl37SNf7K9i4C0xNE0RTDPgwkxA9XhPm0MFbfSIOP2_ToY4IdNUvWo
	SGIvbVlLLl0c8EXLruqmP2ZDI0CThc6DeqTUsdYh78svv32gj_eGui0VmsyI6yGeeNJ3FYVmmnMb
	larBb.o12zIUR49Lmd7BT8vY.UgjPAmJFHXehWtaSx1nPn7awucq9s8qt.Hao1ukhWYGtGN2A0iw
	y.AAnM430.IAbdI8x4t4B2iJ587rlU99MLXIrloykB8z3RqAkngF7Ve3eBySF2Y5JgmEFHQoZRYu
	CYYCMcKtuZARw8Vj9ATvOJRgy62Sbk0Yu6uaVcFpA3x0sVRJ._ZkVC4_3CMbq8PgsocdYzpmO5e_
	AWf4Ysn_Dh..0AUxNmYC33RychOwGVpTf5RWJDjcLGlHdxf_.soht2LMR.9R5XPSXFWnEHt1f7_J
	OJ.T5AuOuNSVc6Ui8CxzCcrybiGCISzNis3C7JKkmwlBVMV9kxoS8EAi4lzuEdVeXUMrUejZpePa
	AR76DokmJ3dN_SE_vB9VQKer9vbjhqyrNMDf9Qo12oLIed1Pe.4c._Vp6uX_Q2fXbpwwqNyFajfK
	kdhMRjTyTNpybzuA_sHZb1YYHUSpkNGScnXGpfneYJ0jzqLCAJoKfjJZYqJXb10wXGLgG1zi3Les
	B91nniYdzQEuWiF50mWHq9G6eS4CUFuhq.hkn.xwT7pZmTJIaS5YIDd36A1mhPE0fJfBEy7Sbnap
	eB55thwqplrAAt9tNMAk2wINL_vNLGn397P5j0BLALN2G3Iij6A4Z6HSCk8gRLRBSCyVaNOjbfy5
	BLeqMm3WnbK6L.7Ol_r_HGwG0jCtuX3SYPxneL62GfNrfyCNhCeh4EkZmQQ.6c4hFe5RI5HQBpG1
	yTZgnHs_CLZYcKKP_RTVwjdLGuL1oS2RHM9I5WZl7xnAI8Z.6Iufc5IykyXxDkkCZeceV50fUO35
	R9tZl5.pKDcwgkTRh4HaFWbqC9kDwxi22PWZVPktNpsx7YL3Vgefg7E3.ufx.PX8BvZf0FPSw6Sx
	.cUJIDQb4vaoZoT7xd0s-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic314.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 28 Jul 2020 23:42:04 +0000
Received: by smtp421.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID f6f1d93bb9d2ecbf675eab2dcdb1adff; 
	Tue, 28 Jul 2020 23:42:00 +0000 (UTC)
Subject: Re: [PATCH v19 06/23] LSM: Use lsmblob in security_secctx_to_secid
To: John Johansen <john.johansen@canonical.com>, casey.schaufler@intel.com,
	jmorris@namei.org, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org
References: <20200724203226.16374-1-casey@schaufler-ca.com>
	<20200724203226.16374-7-casey@schaufler-ca.com>
	<bebdacdf-2ecb-8e07-1b0e-6e6bfb5960d0@canonical.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Message-ID: <8dd6f4e0-07f0-333e-0663-0bc0889cccf2@schaufler-ca.com>
Date: Tue, 28 Jul 2020 16:41:59 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bebdacdf-2ecb-8e07-1b0e-6e6bfb5960d0@canonical.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
Cc: netdev@vger.kernel.org, linux-audit@redhat.com, sds@tycho.nsa.gov
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/28/2020 4:11 AM, John Johansen wrote:
> On 7/24/20 1:32 PM, Casey Schaufler wrote:
>> Change security_secctx_to_secid() to fill in a lsmblob instead
>> of a u32 secid. Multiple LSMs may be able to interpret the
>> string, and this allows for setting whichever secid is
>> appropriate. Change security_secmark_relabel_packet() to use a
>> lsmblob instead of a u32 secid. In some other cases there is
>> scaffolding where interfaces have yet to be converted.
>>
>> Reviewed-by: Kees Cook <keescook@chromium.org>
>> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
>> Cc: netdev@vger.kernel.org
> one comment below, but its a nice to have so
>
> Reviewed-by: John Johansen <john.johansen@canonical.com>
>
>
>> ---
>>  include/linux/security.h          | 30 +++++++++++++++++++++++----
>>  include/net/scm.h                 |  7 +++++--
>>  kernel/cred.c                     |  4 +---
>>  net/ipv4/ip_sockglue.c            |  6 ++++--
>>  net/netfilter/nft_meta.c          | 18 +++++++++-------
>>  net/netfilter/xt_SECMARK.c        |  9 ++++++--
>>  net/netlabel/netlabel_unlabeled.c | 23 +++++++++++++--------
>>  security/security.c               | 34 ++++++++++++++++++++++++++-----
>>  8 files changed, 98 insertions(+), 33 deletions(-)
>>
>> diff --git a/include/linux/security.h b/include/linux/security.h
>> index d81e8886d799..98176faaaba5 100644
>> --- a/include/linux/security.h
>> +++ b/include/linux/security.h
>> @@ -189,6 +189,27 @@ static inline bool lsmblob_equal(struct lsmblob *bloba, struct lsmblob *blobb)
>>  	return !memcmp(bloba, blobb, sizeof(*bloba));
>>  }
>>  
>> +/**
>> + * lsmblob_value - find the first non-zero value in an lsmblob structure.
>> + * @blob: Pointer to the data
>> + *
>> + * This needs to be used with extreme caution, as the cases where
>> + * it is appropriate are rare.
>> + *
>> + * Return the first secid value set in the lsmblob.
>> + * There should only be one.
> It would be really nice if we could have an LSM debug config, that would
> do things like checking there is indeed only one value when this fn
> is called.

I can't see a CONFIG_LSM_DEBUG for this alone, but if you have
other places you'd like to see it I'm open to it.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

