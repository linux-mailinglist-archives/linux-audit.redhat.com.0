Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD3F60D6E0
	for <lists+linux-audit@lfdr.de>; Wed, 26 Oct 2022 00:13:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666736010;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vZkQZzfqnANbVax+LLtqg4GshG4Pln6tu5W0AZ+4A9E=;
	b=T0MKFC4suGf0u6mikb19CfrRSTLaKx5W2zyDIdeaLZqPQmRzmU87ayNBZmT/J0pxY+9PMM
	Yis/wL/Aij3mWrYILbaj9nriENi4PwwlniAfLvO1A2rfTrerTY/Z/x+qZpO6JL5oU+nEoN
	iBm7otlCWvo9zuQegAs6dFd+teEi5Qc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-vEWLBNPWO_a2RwBvRHYgaA-1; Tue, 25 Oct 2022 18:13:23 -0400
X-MC-Unique: vEWLBNPWO_a2RwBvRHYgaA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0ED3385A583;
	Tue, 25 Oct 2022 22:13:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 572674B3FC6;
	Tue, 25 Oct 2022 22:13:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F2175194704E;
	Tue, 25 Oct 2022 22:13:11 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 27CE21946597 for <linux-audit@listman.corp.redhat.com>;
 Tue, 25 Oct 2022 22:13:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1288A1415114; Tue, 25 Oct 2022 22:13:10 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AF9E140EBF5
 for <linux-audit@redhat.com>; Tue, 25 Oct 2022 22:13:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E42A51C05EA1
 for <linux-audit@redhat.com>; Tue, 25 Oct 2022 22:13:09 +0000 (UTC)
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-KL_IahR9PR-d7xhxHVYA8g-1; Tue, 25 Oct 2022 18:13:07 -0400
X-MC-Unique: KL_IahR9PR-d7xhxHVYA8g-1
Received: from fsav118.sakura.ne.jp (fsav118.sakura.ne.jp [27.133.134.245])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 29PMCoQV066785;
 Wed, 26 Oct 2022 07:12:50 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav118.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav118.sakura.ne.jp);
 Wed, 26 Oct 2022 07:12:50 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav118.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 29PMCoqK066782
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 26 Oct 2022 07:12:50 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <98ab33d6-6c91-9c0a-8647-22f6bdede885@I-love.SAKURA.ne.jp>
Date: Wed, 26 Oct 2022 07:12:47 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: LSM stacking in next for 6.1?
To: Casey Schaufler <casey@schaufler-ca.com>,
 John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>
References: <791e13b5-bebd-12fc-53de-e9a86df23836.ref@schaufler-ca.com>
 <CAHC9VhQPvcunvBDvSnrUChwmGLen0Rcy8KEk_uOjNF1kr4_m9w@mail.gmail.com>
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
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <11564f69-3bba-abf7-eb46-06813ff4a404@schaufler-ca.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2022/10/25 23:12, Casey Schaufler wrote:
> On 10/25/2022 4:20 AM, Tetsuo Handa wrote:
>> On 2022/10/25 19:26, John Johansen wrote:
>>> no, Casey is not. He is trying to find a path forward to get LSM
>>> stacking upstream sooner than later. He has made proposals that
>>> admittedly you have not liked, but he has at least tried to propose
>>> ideas that could work within the insane set of constraints.
>> I'm OK with getting LSM stacking upstream. But changes made based on
>> only built-in modules are bad. If LSM id cannot be assigned to loadable
>> LSM modules at runtime because not all loadable LSM modules will be
>> in-tree in order to get an LSM id assigned, loadable LSM modules won't
>> be able to utilize e.g. lsm_module_list system call (or whatever
>> changes made while trying to unshare resources/interfaces currently
>> shared among SELinux/Smack/AppArmor).
>>
>> It will be a complete reinvention of Linux security framework which is
>> merely borrowing hooks provided by LSM. That is no different from
>> duplicating existing LSM hooks and managing via completely different
>> set of interfaces (e.g. /proc/$pid/attr2/$lsmname/$filename ,
>> /sys/kernel/security2/$lsmname/$filename ). Such implementation is
>> no longer loadable LSM. It is LSM version 2. And I don't think that
>> such implementation will be accepted unless you agree to kill current
>> LSM (say, LSM version 1).
> 
> The counter argument to this statement is that BPF has been accepted
> upstream. eBPF programs are different from built-in security modules.
> There is no reason that a well implemented LSM that accepts loadable
> modules *that are different* from built-in modules couldn't be created.
> I seriously doubt that it would get upstream for all the reasons
> usually cited. But there is nothing about the implementation I've proposed
> that would prevent it.
> 

As an easy example, please show me an eBPF program that allows restricting where
to chroot to and allows configuring where to chroot to using /sys/kernel/security/
interface.

An loadable LSM consists of hooks (for filtering access requests) and interface
(for configuring rules whether to filter access requests).

Your LSM id approach makes it impossible to use interface (due to lack of LSM id
for loadable LSM modules) by loadable LSM modules. LSM id must not be limited to
built-in LSM modules.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

