Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A8E60D74B
	for <lists+linux-audit@lfdr.de>; Wed, 26 Oct 2022 00:42:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666737744;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DmqSmemK1dVKRYTlEog/BaixYD91k2/eEmdWDeukZIE=;
	b=Az+i9ylS9O34fEUOJaiLlRAcOgSVPolIZAxOCJTjrj2tTtQ5CvxTF/YMqxYtEFI5yuWaDD
	Tzb/j5SFBMJRj9gWAOt4ZVMyGzn1TvEYxm/SsvGJwUf9OeHbeqcmDuubJTYBPC1jBGnKXr
	05k6tdtqFcKvznJlZ+D0nTVojW2vJJI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-x06ZBQQ6NZKWFqHcXumYOw-1; Tue, 25 Oct 2022 18:42:20 -0400
X-MC-Unique: x06ZBQQ6NZKWFqHcXumYOw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BAF9382DFC9;
	Tue, 25 Oct 2022 22:42:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 342861415127;
	Tue, 25 Oct 2022 22:42:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A1251194704E;
	Tue, 25 Oct 2022 22:42:03 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D69271946597 for <linux-audit@listman.corp.redhat.com>;
 Tue, 25 Oct 2022 22:42:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 45E60200BBD2; Tue, 25 Oct 2022 22:42:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D2BD2027064
 for <linux-audit@redhat.com>; Tue, 25 Oct 2022 22:42:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3506486EB31
 for <linux-audit@redhat.com>; Tue, 25 Oct 2022 22:41:55 +0000 (UTC)
Received: from sonic306-28.consmr.mail.ne1.yahoo.com
 (sonic306-28.consmr.mail.ne1.yahoo.com [66.163.189.90]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-349-fsQfLTvLNdeZsdAw_iy1_Q-1; Tue,
 25 Oct 2022 18:41:52 -0400
X-MC-Unique: fsQfLTvLNdeZsdAw_iy1_Q-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1666737711; bh=Rjw8+yCPHFLjHmyTJOgoHgIZ+qwUuTwkIfB10EhUcaI=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=QIX8oDibnPfHsUZcZYWokaB0D4/TZFfp+Uk9L6XY2RICFbhelD3nSLgYqYH8c6OjsEZa1ULnuPy0u/6Sua7FA3gC9BNwFOuhglmCI4gMLv44pmoQZMTupAeYTJquxexEbXfmv0wl2jZelI9AEx+ZyVfW5kALxVF5Zebk6tU4uFOzs251wXbBu2NLH62ZJVBDlPevFg4er8xSxvZQqIIkqo4U/K0A5NKzlRt7meNXS6YPJKG/FY9G1yp+7xAFb+DMvhR2K3QCQkxuGyEtcPaP69MTx2kWzLaPMfE+Z7lbSz2GGDlMqm8gxZLzOIQERk82wKQrM5EywIsRnOBMGTdmHg==
X-YMail-OSG: _XVz2CAVM1neWScmgrBZujRvephqhjTukj0oF0ulAtfxukik7ON3Md1EDc.kdwl
 b2sC2Gl9TpBmVdiUNZHP8NHBL1SL95I4sP3exWc.WHTqo5.fllfUrtLEjgXoP20g2LkYAxUoxGn8
 kvJxrbByPf2c_TlkUvVwSY_SKpcd0PRiAui6Lml04Oz0kKuqGce7QFghxulZtBvwdIibsU3nn_c.
 OsZWw45wWthirgx6HInMWid2F4qh6Pyx0QtEB.fKl1uFkZZhlXOZXSi_5afnR8fECUL2ZNSpBLQO
 CGTBTw6w_G1qtyzZrL9leuIkKb5SSfjld074Pt4ToZsdfMRjzV0MZELtHvwajXUL3HfYNpTLUTdP
 Jkwj03cYolTnLz89guRos.qv.0xkYBE5uIwWbcAx8BbANHU8bHZZybqMk90nOyk.dHG7XeuJWPW6
 fRVNd.S9swx2H69ZVEIaevG_rZL7mTNg9wsD7ViJZMFABe8tZvSxpKzrQ6Rgn.C57hfYdaE7MRNV
 qNai6Z2WLLSpLGh9I0BH7ENaikKRCsqgPk8NFiuBwWy2isMI4YyM6MuoAM5kz18Eogz9QuAJpBQU
 fhGTBjowcH0oxZ35FOardw6Yv.ijoI7MjEMJYOzg7FhHYLkSmT3n2U.P_uNseQ2C4ECVWz1kNXxs
 KtxWERxamFa9sgS.PWsPvr47EP8c2kaThXiThyx.DaPuvfSklOe9TSOaZKCXj6QyLsRHqUPd18sE
 nuXkvAe_4mvD1KGDjT8vCDIWNo_lKWczjzOxHoslEvSI.T7cYTMDcUqrRmWVU15YV0GDAMFsH7wZ
 WA6wuFAI1IoNUlQjI1M5AAUvTThtA9HigvfKI1f.41CA1brl0LE7upegFUEeoZGgbHLTdmb7rqw2
 T5goc0iIt89yVo7AcOXo1yXY725cbEi.mk7HBdJqFC1XnPAye.IcBjw8kPzvyUJM4uJrQro8aIEr
 ksCJGeG4UpqKIt2Fgf4DQIKtQTe.1eGcoJmNn1zSLlrD9dGHTc9.4DwX6rnkjbTMiugbqEAjyeLM
 ND2DQqhASej7ODZFyivYUb.LC0PxIEFbyIWWJzkjWKV3ZdMqS29.jR7ySW9lyRYkEjNQF8NoqWI8
 M.IDGxewX5f9.4CO9T4tUpcVm1rD.c6M7dD4U8XJuk9CpL0Hlg47GDUsx9HoZsBeGJwTq3UgH.7r
 WhOO8Ae0c3aIdxf9rtJbZWdMViCTBcjFL8sFwpecU.jk_5Qm01jIBHwuyECa7252KjYqKw8Rge6Q
 yJe7H85kiMHOwuLjdxStF6qMOwZlB0hShmcY2M5mLCfBdt_IXlUP32S62M7dkS4b1PGe27RfW0_A
 0CLXWu_c.QF7s3tRgFCkUhz5Se9I5UtsKpSjROv4llsdKJJBqytAUXPQfnk8HNI38rmeaxC6.5Tp
 ubAMbLgEfpWOmkM6W4yNFZ9cTinGsQIdYIjmZTl5qC6kPU2YTqts9N.1h7PnaL1wN.hq_wW3x0LK
 tqp97QX.yXEOm8lilF4.2Mza613cGPnEAvzCrgIiRdt4NEwgMi5kAOM31yFTQLcoPUy3Q_OP7c5b
 dEu8IdoQssLo0UItOsIBMKj_sa3yz65y7kdh8FyR1NeotVhZ.lO0qFs3SCNRf25y4FiCHwSPNejz
 GCMN2.5qTzBoAD8jSpupGLmL3i6phcSmPaWz4NmUcStJVKl3Dv8ITYR22FUFbxhITwXM9JOHnPxX
 QJyZerpjz4yS8g8ReDpwe.LMkOkSmpoL6OiUCXC6i.r6fwAWiucCKbGJmcvt30Wd5Jt4J6yyUqYl
 dZ9o4apmFbe63xXnmNkosG3p0sFJ5BAhPH4jjQ7y4b0_jRla3yu2iWtS5m0_2oOrgj.1qdp0cIKw
 1U.bDoDCdrQij1i.aszOjiyBFqD2BLuqMFlXuz20tM4E9R0ZATPmkn1C4m247V6GJm.lZPzovqHp
 p.5G3FW2PexrpsbvaBSDmiEmHRn.aJ_9Tl0yMauy7ezsMO7IWxCYpb1MC.QphjMePhqUaaY9WzWU
 oKMIbxIqp9HtC3XR4FkR5B_m7p4gfcAo_iU6plJn17LhS8v17CUNa8Y6vSCsyPCM9KId021q8d1Y
 ZvEobDEaCx8NBwLHDUtNuT9sXP.dY15CLo55IooB4TMiaRW5KiCB3u.ZkEXFoK7_.aCKDbDuMH0X
 eS_HZz_MNOaIbnHU54iUoYDxr4sN.D_.aIUpZU9HdzFr81EB3vpyO7BDyMpE_NneU15A7QrnheTe
 COcEPNf0cr6A3DQgdRuJhrsItQiKLmYizrRMXjpVWJgDE5ZMtI5ZXzfb4f184vTj.vO9gJGAJzr6
 5aKT6SAHWcJZ6jaRIaFlynoB2nit7qQ--
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.ne1.yahoo.com with HTTP; Tue, 25 Oct 2022 22:41:51 +0000
Received: by hermes--production-gq1-754cb59848-zdkt4 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 4afb9de0bef7eb910cec93e212a5865a; 
 Tue, 25 Oct 2022 22:41:46 +0000 (UTC)
Message-ID: <aa201ed7-9ca1-9507-08cc-156f280ee5f4@schaufler-ca.com>
Date: Tue, 25 Oct 2022 15:41:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: LSM stacking in next for 6.1?
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 John Johansen <john.johansen@canonical.com>, Paul Moore <paul@paul-moore.com>
References: <791e13b5-bebd-12fc-53de-e9a86df23836.ref@schaufler-ca.com>
 <6552af17-e511-a7d8-f462-cafcf41a33bb@schaufler-ca.com>
 <CAHC9VhQMeyxQJSAUuigu=CCr44WtpJg=LEh1xng_bPfCCjqq6Q@mail.gmail.com>
 <5ef4a1ae-e92c-ca77-7089-2efe1d4c4e6d@schaufler-ca.com>
 <CAHC9VhQRpeOMkeEfy=VRPnpuYMUDYgLp56OjQZPYwoXmfHYREQ@mail.gmail.com>
 <c679cea7-bb90-7a62-2e17-888826857d55@schaufler-ca.com>
 <e9ce6253-c8a3-19c3-1b71-f3a2e04539bc@I-love.SAKURA.ne.jp>
 <cc14bbde-529e-376c-7d27-8512ec677db3@schaufler-ca.com>
 <ff43e254-0f41-3f4f-f04d-63b76bed2ccf@I-love.SAKURA.ne.jp>
 <1a9f9182-9188-2f64-4a17-ead2fed70348@schaufler-ca.com>
 <2225aec6-f0f3-d38e-ee3c-6139a7c25a37@I-love.SAKURA.ne.jp>
 <5995f18c-5623-9d97-0aa6-5f13a2a8e895@I-love.SAKURA.ne.jp>
 <77ec837a-ff64-e6f0-fe14-a54c1646ea0b@canonical.com>
 <0fcc5444-a957-f107-25a1-3540588eab5a@I-love.SAKURA.ne.jp>
 <11564f69-3bba-abf7-eb46-06813ff4a404@schaufler-ca.com>
 <98ab33d6-6c91-9c0a-8647-22f6bdede885@I-love.SAKURA.ne.jp>
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <98ab33d6-6c91-9c0a-8647-22f6bdede885@I-love.SAKURA.ne.jp>
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
Cc: keescook@chromium.org, SElinux list <selinux@vger.kernel.org>,
 James Morris <jmorris@namei.org>, Mimi Zohar <zohar@linux.ibm.com>,
 LSM List <linux-security-module@vger.kernel.org>, linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/25/2022 3:12 PM, Tetsuo Handa wrote:
> On 2022/10/25 23:12, Casey Schaufler wrote:
>> On 10/25/2022 4:20 AM, Tetsuo Handa wrote:
>>> On 2022/10/25 19:26, John Johansen wrote:
>>>> no, Casey is not. He is trying to find a path forward to get LSM
>>>> stacking upstream sooner than later. He has made proposals that
>>>> admittedly you have not liked, but he has at least tried to propose
>>>> ideas that could work within the insane set of constraints.
>>> I'm OK with getting LSM stacking upstream. But changes made based on
>>> only built-in modules are bad. If LSM id cannot be assigned to loadable
>>> LSM modules at runtime because not all loadable LSM modules will be
>>> in-tree in order to get an LSM id assigned, loadable LSM modules won't
>>> be able to utilize e.g. lsm_module_list system call (or whatever
>>> changes made while trying to unshare resources/interfaces currently
>>> shared among SELinux/Smack/AppArmor).
>>>
>>> It will be a complete reinvention of Linux security framework which is
>>> merely borrowing hooks provided by LSM. That is no different from
>>> duplicating existing LSM hooks and managing via completely different
>>> set of interfaces (e.g. /proc/$pid/attr2/$lsmname/$filename ,
>>> /sys/kernel/security2/$lsmname/$filename ). Such implementation is
>>> no longer loadable LSM. It is LSM version 2. And I don't think that
>>> such implementation will be accepted unless you agree to kill current
>>> LSM (say, LSM version 1).
>> The counter argument to this statement is that BPF has been accepted
>> upstream. eBPF programs are different from built-in security modules.
>> There is no reason that a well implemented LSM that accepts loadable
>> modules *that are different* from built-in modules couldn't be created.
>> I seriously doubt that it would get upstream for all the reasons
>> usually cited. But there is nothing about the implementation I've proposed
>> that would prevent it.
>>
> As an easy example, please show me an eBPF program that allows restricting where
> to chroot to and allows configuring where to chroot to using /sys/kernel/security/
> interface.
>
> An loadable LSM consists of hooks (for filtering access requests) and interface
> (for configuring rules whether to filter access requests).
>
> Your LSM id approach makes it impossible to use interface (due to lack of LSM id
> for loadable LSM modules) by loadable LSM modules. LSM id must not be limited to
> built-in LSM modules.

I'm sorry that I am failing to communicate my understanding of why this
isn't true. You need a built-in LSM that loads and manages loadable
security modules. That LSM would have an LSM ID just like the BPF LSM
has a LSM ID. I have no doubt that there are multiple workable implementations,
as I have looked into many different ways to implement the stacking for
built-in modules. I am also sorry that I don't expect to have enough working
years left to even consider spending any more time on the problem. This is
a development effort for The Next Generation.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

