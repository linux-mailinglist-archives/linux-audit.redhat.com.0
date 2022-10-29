Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEED6121E1
	for <lists+linux-audit@lfdr.de>; Sat, 29 Oct 2022 11:34:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667036058;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Rdz0r6acE76DvQ6rId3WCxlxdanB6dyp2WGo6pLPjus=;
	b=RaZmTdInOxQuE40463k0m/UFqVTo1lbXfo3yp5pn9QXjB68mJQ3RGoWI2svLmEz0ldC6ye
	qhLChZL81S1m9bSpGUYB8Cvf6asY51ajaz7QgRSpaZQmrv/40nprHEgzBwfgXuIiRjsW67
	anZml7LYucoPBDig0oJAf0oE8F8QFMw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-B8EH57wIMEmVkq3se_bxTQ-1; Sat, 29 Oct 2022 05:34:15 -0400
X-MC-Unique: B8EH57wIMEmVkq3se_bxTQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 198C085A5A6;
	Sat, 29 Oct 2022 09:34:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 649901759E;
	Sat, 29 Oct 2022 09:34:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 585921946A40;
	Sat, 29 Oct 2022 09:34:05 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0FB281946586 for <linux-audit@listman.corp.redhat.com>;
 Sat, 29 Oct 2022 09:34:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E24C51759E; Sat, 29 Oct 2022 09:34:03 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D9C624EA5F
 for <linux-audit@redhat.com>; Sat, 29 Oct 2022 09:34:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90F1C1C0754F
 for <linux-audit@redhat.com>; Sat, 29 Oct 2022 09:34:03 +0000 (UTC)
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-XlCc7bDgNTyyJpLqztLdPQ-1; Sat, 29 Oct 2022 05:34:00 -0400
X-MC-Unique: XlCc7bDgNTyyJpLqztLdPQ-1
Received: from fsav315.sakura.ne.jp (fsav315.sakura.ne.jp [153.120.85.146])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 29T9XeSS061021;
 Sat, 29 Oct 2022 18:33:40 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav315.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav315.sakura.ne.jp);
 Sat, 29 Oct 2022 18:33:40 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav315.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 29T9XeZG061016
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 29 Oct 2022 18:33:40 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <87c2eb1b-0f50-5d8c-1dad-c7059e2fb0c1@I-love.SAKURA.ne.jp>
Date: Sat, 29 Oct 2022 18:33:42 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: LSM stacking in next for 6.1?
To: Kees Cook <keescook@chromium.org>
References: <ff43e254-0f41-3f4f-f04d-63b76bed2ccf@I-love.SAKURA.ne.jp>
 <1a9f9182-9188-2f64-4a17-ead2fed70348@schaufler-ca.com>
 <2225aec6-f0f3-d38e-ee3c-6139a7c25a37@I-love.SAKURA.ne.jp>
 <5995f18c-5623-9d97-0aa6-5f13a2a8e895@I-love.SAKURA.ne.jp>
 <77ec837a-ff64-e6f0-fe14-a54c1646ea0b@canonical.com>
 <0fcc5444-a957-f107-25a1-3540588eab5a@I-love.SAKURA.ne.jp>
 <CAHC9VhQy91eezWMQ=MoLe3fQSu_Rc+ZUWW2Mm3+78Mr7vS_Z0A@mail.gmail.com>
 <a0567b10-fa83-50f4-7bf6-937e0c677e60@I-love.SAKURA.ne.jp>
 <CAHC9VhT2Azg1F-G3RQ4xL7JgA3OAtHafzS1_nvUyEUFsCJ9+SA@mail.gmail.com>
 <56add81d-0ea7-9d3e-0e30-e0b02e62a8d0@I-love.SAKURA.ne.jp>
 <202210280944.AF75E37DC@keescook>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <202210280944.AF75E37DC@keescook>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
Cc: John Johansen <john.johansen@canonical.com>,
 SElinux list <selinux@vger.kernel.org>, James Morris <jmorris@namei.org>,
 Mimi Zohar <zohar@linux.ibm.com>,
 LSM List <linux-security-module@vger.kernel.org>, linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2022/10/29 2:40, Kees Cook wrote:
> On Fri, Oct 28, 2022 at 10:58:30PM +0900, Tetsuo Handa wrote:
>> I consider /sbin/insmod-able LSM modules as a compromise/remedy for LSM modules
>> which could not get merged upstream or supported by distributors, for patching and
>> rebuilding the whole kernel in order to use not-yet-upstreamed and/or not-builtin
>> LSMs is already a lot of barrier for users. But requiring a permanent integer in
>> order to use a LSM module is a denial of even patching and rebuilding the whole
>> kernel. That's why I hate this change.
> 
> But the upstream kernel _does not support APIs for out-of-tree code_. To
> that point, security_add_hooks() is _not exported_, so it is already not
> possible to create a modular LSM without patching the kernel source.

AKARI/CaitSith and several other LSM modules are running without patching
the kernel source. But this patchset makes it impossible to use 9 out of 13
LSM modules as (not upstreamed but) built-in LSM modules by patching the kernel,
due to lack of identifier. That's a needless requirement that harms development
of LSM modules.

Linux kernel has started using a new and more inclusive terminology for the
Linux kernel code and documentation. But this patchset is making the code
more and more exclusive. That's a way to exclude LSM modules that satisfies
user's need, even if perfect LSM stacking implementation is provided.

What do you think if an authority commands you that companies like Intel, Google,
RedHat, Canonical etc. must wind up because these companies are not member of
that authority? That's behavior of autocracy.

This patchset _does not allow out-of-tree code to exist_ rather than simply
_does not support APIs for out-of-tree code_. The behavior of this patchset is
to exclude 9 out of 13 LSM modules, unless upstream kernel allows these modules
to exist (by assigning an LSM id value). What a closed community LSM is!

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

