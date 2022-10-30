Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D75C612747
	for <lists+linux-audit@lfdr.de>; Sun, 30 Oct 2022 05:04:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667102695;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=d29/xQZIQPxWP2khVS1kKw5gRU4VikOcFDkMyErdPO4=;
	b=Gk5fLjGuWeVWATxkgK2s3Xjw3Jv6rNEnUih2HBKwGAvOpzTW1oWeyULkfRAqwTJtkdRRmL
	Rvo5GJSFxzM+RM//q3qS2RVl4iXTRgTqbELy723VtX9f061c/uAMLUnIzpGHME+oTH3umi
	GdqrYztjQqqJ8HjaE7GIC8gVJtjO4is=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-ElYqSz3oOgmhTf3caJc_4Q-1; Sun, 30 Oct 2022 00:04:51 -0400
X-MC-Unique: ElYqSz3oOgmhTf3caJc_4Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54AD4185A792;
	Sun, 30 Oct 2022 04:04:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 183C92166BA3;
	Sun, 30 Oct 2022 04:04:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 15A5A194658F;
	Sun, 30 Oct 2022 04:04:40 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E3E271946586 for <linux-audit@listman.corp.redhat.com>;
 Sun, 30 Oct 2022 04:04:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 21663140EBF3; Sun, 30 Oct 2022 04:04:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 196B01401C24
 for <linux-audit@redhat.com>; Sun, 30 Oct 2022 04:04:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE19E800B23
 for <linux-audit@redhat.com>; Sun, 30 Oct 2022 04:04:26 +0000 (UTC)
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-V4Y41ftFN3iwhFFfLql4ew-1; Sun, 30 Oct 2022 00:04:23 -0400
X-MC-Unique: V4Y41ftFN3iwhFFfLql4ew-1
Received: from fsav414.sakura.ne.jp (fsav414.sakura.ne.jp [133.242.250.113])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 29U441iI085370;
 Sun, 30 Oct 2022 13:04:01 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav414.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav414.sakura.ne.jp);
 Sun, 30 Oct 2022 13:04:01 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav414.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 29U43sjp085350
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sun, 30 Oct 2022 13:04:01 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <53b07579-82f5-404e-5c2c-de7314fff327@I-love.SAKURA.ne.jp>
Date: Sun, 30 Oct 2022 13:03:57 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: LSM stacking in next for 6.1?
To: John Johansen <john.johansen@canonical.com>,
 Casey Schaufler <casey@schaufler-ca.com>, Paul Moore <paul@paul-moore.com>
References: <791e13b5-bebd-12fc-53de-e9a86df23836.ref@schaufler-ca.com>
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
 <aa201ed7-9ca1-9507-08cc-156f280ee5f4@schaufler-ca.com>
 <3266c2c2-cd7e-bc0f-0fc4-478a63d6ee77@I-love.SAKURA.ne.jp>
 <f7548061-e82d-9a39-ed15-0d32551b4099@canonical.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <f7548061-e82d-9a39-ed15-0d32551b4099@canonical.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Spam-Signature: yes
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2022/10/28 19:14, John Johansen wrote:
> On 10/26/22 03:19, Tetsuo Handa wrote:
>> On 2022/10/26 7:41, Casey Schaufler wrote:
>>>              You need a built-in LSM that loads and manages loadable
>>> security modules.
>>
>> That is no longer loadable LSM modules. A loadable LSM module must be capable of
>> loading any code and using any interface that is allowed to loadable kernel modules
>> using /sbin/insmod command. That is my understanding of what you have promised (and
>> the reason I am allowing you to continue working on LSM stacking before I make
>> CONFIG_SECURITY_TOMOYO=m).
>>
> 
> Tetsuo, think of it this way. LSM stacking is going to make it much easier for new
> LSM modules because they won't automatically be excluded because one of the other
> LSMs is needed.
> 
> The problem of loadable LSM modules is orthogonal, and Casey shouldn't need to
> solve it in this patch series. That is further work to be taken up by another,
> as Casey has clearly stated its work he is not interested in doing.
> 
> However the real problem you are trying to solve won't be solved by loadable LSM
> modules, though they may help. Just having loadable LSMs modules won't mean a
> distro will build an LSM as a loadable module instead of disabling it, nor does
> it mean a distro will allow loading an out of tree LSM module. Even if the
> upstream kernel doesn't provide an option to block loading them, distros will.
> 

What do you think the background of

  Ultimately the challenge is getting userspace developers to accept a
  change that is not part of the upstream Linux Kernel and thus not
  guaranteed under the usual "don't break userspace" kernel API promise.

is? I consider that the reason is because

  We do care about userspace programs and users who are using userspace programs.

. If we don't care about userspace and users, we would not mind breaking APIs.
This reasoning is more stronger than "we don't care about out-of-tree code"
reasoning.

Distributors have rights to block loading loadable kernel modules which are
not included in upstream kernels. But for example Red Hat is not excising
the rights to block loading loadable kernel modules (e.g.
https://access.redhat.com/solutions/1376133 ). What do you think about the
reasons of not blocking loading loadable kernel modules which are not included
in upstream kernels? I consider that the reason is because

  Allowing loadable kernel modules which cannot be supported by distributors
  to exist and to be loaded into distributor kernels is more beneficial for
  users.

That is, we have been allowing out-of-tree kernel code to exist because
out-of-tree kernel code can be beneficial for users despite distributors cannot
afford supporting out-of-tree kernel code.

If you really think that we have the rights to lock out out-of-tree kernel code
and/or disable loading of out-of-tree kernel code via /sbin/insmod, firstly achieve

  (1) Disallow loading of non-GPL kernel modules. (It is a trivial change.)

  (2) Disallow loading of out-of-tree kernel code via /sbin/insmod .
      (I don't know how we can technically enforce such change. Unlike not assigning
      LSM id value to LSM modules, we need to somehow be able to check whether an
      arbitrary file is in-tree (e.g. forbid "git add some_file") and unmodified
      (e.g. forbid "patch -p1 < some_patch").

before you enforce requiring an LSM id value in order to register an LSM module.
I don't accept "I'm not interested in making such changes". It is your duty to
achieve if you use "we don't care about out-of-tree code" as a rationale for
requiring an LSM id value in order to register an LSM module.

Nowadays, many software is developed using programming languages which can generate code
for multiple operating systems. That is, people are getting indifferent with operating
systems they run their software. Then, what is an advantage of choosing Linux as operating
systems for running their software, if Linux kernel does not provide freedom for
customization depending on user's needs?

As web application developers increases, developers who can understand C language (and
system call) are decreasing. As a result, it is getting more and more difficult to let them
understand and manage fine-grained allowlisting-based access controls like SELinux. Then,
what is an advantage of choosing Linux as operating systems for running their software, if
LSM does not provide freedom for using whatever simpler LSM modules users want?

Windows operating system provides WSL (Windows Subsystem for Linux) which allows running
CUI programs and servers which are designed for Linux. Windows users can run CUI programs
and servers without requiring real Linux kernels and can run GUI programs via Windows
kernels. Neither SELinux nor AppArmor is required for protecting programs/servers, for
antivirus software for Windows will provide protection. Then, what is an advantage of using
real Linux kernels, if we cannot allow Linux kernels to use whatever LSM modules users want?

I believe that it is time to get out of "we don't care about out-of-tree code".
The "we don't care about out-of-tree code" reasoning is a brain freeze that leads to
forget about users who still continue using Linux as platform for running their software.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

