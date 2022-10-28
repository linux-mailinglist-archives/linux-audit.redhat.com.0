Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBB06111E4
	for <lists+linux-audit@lfdr.de>; Fri, 28 Oct 2022 14:50:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666961456;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cnMuQjlkTd+G/vvYTLYWZsISOyZLAIHkLCfUM1jKBBc=;
	b=FvLMs2kKcwFpzZgGlHHLEFP8ckFaqf5MElCQPb8VZ1aX3P2OTNGdV4R3C1NtfEkRpS+rmt
	yHuk8C3TYvksW2e/taK6iTkxitdsNrhQwLyxv9HRTYYU/e38hJ3wffAh4wTSTyCxCVa4XG
	SmPtFAtcud5+Kg1z9eWAsI3K2WdO6ws=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189-FK6LTeTNPlqyT1H0QkfnvQ-1; Fri, 28 Oct 2022 08:50:55 -0400
X-MC-Unique: FK6LTeTNPlqyT1H0QkfnvQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E787D101A52A;
	Fri, 28 Oct 2022 12:50:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0AF661415102;
	Fri, 28 Oct 2022 12:50:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2554B194704E;
	Fri, 28 Oct 2022 12:50:45 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 966651946586 for <linux-audit@listman.corp.redhat.com>;
 Fri, 28 Oct 2022 10:14:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6C52D2024CB7; Fri, 28 Oct 2022 10:14:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6499C200A7A2
 for <linux-audit@redhat.com>; Fri, 28 Oct 2022 10:14:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41BA33C0ED57
 for <linux-audit@redhat.com>; Fri, 28 Oct 2022 10:14:13 +0000 (UTC)
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-644-K4VnWzU0O56NIjvUo4Mgzw-1; Fri,
 28 Oct 2022 06:14:11 -0400
X-MC-Unique: K4VnWzU0O56NIjvUo4Mgzw-1
Received: from [172.20.1.180] (unknown [62.168.35.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id E91F5422EB; 
 Fri, 28 Oct 2022 10:14:09 +0000 (UTC)
Message-ID: <f7548061-e82d-9a39-ed15-0d32551b4099@canonical.com>
Date: Fri, 28 Oct 2022 03:14:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: LSM stacking in next for 6.1?
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
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
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <3266c2c2-cd7e-bc0f-0fc4-478a63d6ee77@I-love.SAKURA.ne.jp>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Fri, 28 Oct 2022 12:50:43 +0000
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 10/26/22 03:19, Tetsuo Handa wrote:
> On 2022/10/26 7:41, Casey Schaufler wrote:
>>              You need a built-in LSM that loads and manages loadable
>> security modules.
> 
> That is no longer loadable LSM modules. A loadable LSM module must be capable of
> loading any code and using any interface that is allowed to loadable kernel modules
> using /sbin/insmod command. That is my understanding of what you have promised (and
> the reason I am allowing you to continue working on LSM stacking before I make
> CONFIG_SECURITY_TOMOYO=m).
> 

Tetsuo, think of it this way. LSM stacking is going to make it much easier for new
LSM modules because they won't automatically be excluded because one of the other
LSMs is needed.

The problem of loadable LSM modules is orthogonal, and Casey shouldn't need to
solve it in this patch series. That is further work to be taken up by another,
as Casey has clearly stated its work he is not interested in doing.

However the real problem you are trying to solve won't be solved by loadable LSM
modules, though they may help. Just having loadable LSMs modules won't mean a
distro will build an LSM as a loadable module instead of disabling it, nor does
it mean a distro will allow loading an out of tree LSM module. Even if the
upstream kernel doesn't provide an option to block loading them, distros will.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

