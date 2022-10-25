Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0750360C932
	for <lists+linux-audit@lfdr.de>; Tue, 25 Oct 2022 12:00:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666692024;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OGS7OiAqPSlkz5Z8QbatU8kOWQoZwEALU+ewYXvWfTw=;
	b=Zw1++HIGPiyfRFWte4xQYH3gJ8VzrTPG8+qqD3qsLvNjf7aXyTXBOUoaI18ct58JvbsR3s
	ZnUH45hLjkA2q3XVv3paxzS6Q1eotviwuLpsPELAj81DhWT9DIW7B5wLegtZ4MWyf9WdXg
	/HcZf8IlDb9jUbJCZTokGXSaXdBV/Bk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-8dGejWXFOoyI05VYp0v5wA-1; Tue, 25 Oct 2022 06:00:22 -0400
X-MC-Unique: 8dGejWXFOoyI05VYp0v5wA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3FF813C0F227;
	Tue, 25 Oct 2022 10:00:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 88862492B11;
	Tue, 25 Oct 2022 10:00:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D725E1946A6D;
	Tue, 25 Oct 2022 10:00:18 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B788C1946597 for <linux-audit@listman.corp.redhat.com>;
 Tue, 25 Oct 2022 10:00:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9C9092166B34; Tue, 25 Oct 2022 10:00:17 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 958B62166B2A
 for <linux-audit@redhat.com>; Tue, 25 Oct 2022 10:00:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76C14858282
 for <linux-audit@redhat.com>; Tue, 25 Oct 2022 10:00:17 +0000 (UTC)
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-4CMeIJLEO4O3ahwqP8doUg-1; Tue, 25 Oct 2022 06:00:15 -0400
X-MC-Unique: 4CMeIJLEO4O3ahwqP8doUg-1
Received: from fsav112.sakura.ne.jp (fsav112.sakura.ne.jp [27.133.134.239])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 29P9xAOB031963;
 Tue, 25 Oct 2022 18:59:10 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav112.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav112.sakura.ne.jp);
 Tue, 25 Oct 2022 18:59:10 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav112.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 29P9xAnV031959
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 25 Oct 2022 18:59:10 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <86b65dc6-466c-abbd-0601-d07923bc3d10@I-love.SAKURA.ne.jp>
Date: Tue, 25 Oct 2022 18:59:06 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v38 04/39] LSM: Maintain a table of LSM attribute data
To: Casey Schaufler <casey@schaufler-ca.com>, casey.schaufler@intel.com,
 paul@paul-moore.com, linux-security-module@vger.kernel.org
References: <20220927195421.14713-1-casey@schaufler-ca.com>
 <20220927195421.14713-5-casey@schaufler-ca.com>
 <9907d724-4668-cd50-7454-1a8ca86542b0@I-love.SAKURA.ne.jp>
 <f6b8ac05-6900-f57d-0daf-02d5ae53bc47@schaufler-ca.com>
 <a130dc1f-a187-2957-25c1-974fb9c2569f@I-love.SAKURA.ne.jp>
 <753dfbe8-c68c-5e16-c4d0-1e14cd831c2e@schaufler-ca.com>
 <55f27f99-3a2b-3482-6dc2-12203948dd35@I-love.SAKURA.ne.jp>
 <7263e155-9024-0508-370c-72692901b326@schaufler-ca.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <7263e155-9024-0508-370c-72692901b326@schaufler-ca.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
Cc: john.johansen@canonical.com, keescook@chromium.org, selinux@vger.kernel.org,
 jmorris@namei.org, linux-kernel@vger.kernel.org, linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

(Oops. I chose a wrong mail. Replying to intended mail.)

On 2022/10/25 1:37, Casey Schaufler wrote:
>>  What I'm insisting is that "warrant the freedom to load
>> loadable LSM modules without recompiling the whole kernel".
> 
> Since security modules are optional and the LSM infrastructure
> itself is optional you can't ensure that any given kernel would
> support a loadable security module.

Like I propose adding EXPORT_SYMBOL_GPL(security_hook_heads),
I'm not taking about distributors who choose CONFIG_SECURITY=n.

>> Adding EXPORT_SYMBOL_GPL(security_hook_heads) is the only way that can "allow
>> LSM modules which distributors cannot support to be legally loaded".
> 
> I believe that I've identified an alternative. It isn't easy or cheap.

No. You are just handwaving/postponing the problem using something unknown
that is not yet shown as a workable code. Anything that can be disabled via
kernel config option cannot be an alternative.

  Quoting from https://lkml.kernel.org/r/2225aec6-f0f3-d38e-ee3c-6139a7c25a37@I-love.SAKURA.ne.jp
  > Like Paul Moore said
  > 
  >   However, I will caution that it is becoming increasingly difficult for people
  >   to find time to review potential new LSMs so it may a while to attract sufficient
  >   comments and feedback.
  > 
  > , being unable to legally use loadable LSMs deprives of chances to develop/try
  > new LSMs, and makes LSM interface more and more unattractive. The consequence
  > would be "The LSM interface is dead. We will give up implementing as LSMs."

The biggest problem is that quite few developers show interest in loadable LSM modules.
How many developers responded to this topic? Once the ability to allow loadable LSM
modules is technically lost, nobody shall be able to revive it. You will be happy with
ignoring poor people.

You are already and completely trapped into "only in-tree and supported by distributors
is correct" crap.

> Of course the upstream kernel isn't going to have LSM IDs for out-of-tree
> security modules. That's one of many reasons loadable modules are going to
> have to be treated differently from built-in modules, if they're allowed
> at all.

Then, I have to hate your idea of having fixed sized array.

Nacked-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

