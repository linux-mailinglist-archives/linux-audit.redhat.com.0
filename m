Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AD7613396
	for <lists+linux-audit@lfdr.de>; Mon, 31 Oct 2022 11:27:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667212056;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YnFjCNUX4eI41AOXsB10GXM2IEXGo+25fzrbBGGdCfA=;
	b=Pgy/OP1mc2CT/t/Dor+Lq+3tzsYZ99U96WG/A/6Dg88r0Cw+ko9hqf8Da2kiCz4no3aBPi
	gdtszomXt66Et5xbSsbunMcJXI4hIJLCzYeK0SuSUHtXUq8DRlyCI4bQMH3D8B4hVQaLig
	hQOEvNdA7ALwhScyvNpHNJZYLkgNNfo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-BzDmVzYxMou7oEu8Y293fg-1; Mon, 31 Oct 2022 06:27:33 -0400
X-MC-Unique: BzDmVzYxMou7oEu8Y293fg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C5B2811E75;
	Mon, 31 Oct 2022 10:27:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F1302492B04;
	Mon, 31 Oct 2022 10:27:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BAD0C19465B1;
	Mon, 31 Oct 2022 10:27:21 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7F16E194658C for <linux-audit@listman.corp.redhat.com>;
 Mon, 31 Oct 2022 10:27:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 625FF1410F38; Mon, 31 Oct 2022 10:27:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A901140EBF5
 for <linux-audit@redhat.com>; Mon, 31 Oct 2022 10:27:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1121D38173C2
 for <linux-audit@redhat.com>; Mon, 31 Oct 2022 10:27:20 +0000 (UTC)
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-iRvMHaivO66td5FoMOCvJw-1; Mon, 31 Oct 2022 06:27:17 -0400
X-MC-Unique: iRvMHaivO66td5FoMOCvJw-1
Received: from fsav411.sakura.ne.jp (fsav411.sakura.ne.jp [133.242.250.110])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 29VAQm5s077943;
 Mon, 31 Oct 2022 19:26:48 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav411.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav411.sakura.ne.jp);
 Mon, 31 Oct 2022 19:26:48 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav411.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 29VAQlDJ077940
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 31 Oct 2022 19:26:48 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <feaa5cbc-342e-3863-e761-e7ac8b08d314@I-love.SAKURA.ne.jp>
Date: Mon, 31 Oct 2022 19:26:46 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: LSM stacking in next for 6.1?
To: Kees Cook <kees@kernel.org>, John Johansen <john.johansen@canonical.com>, 
 Casey Schaufler <casey@schaufler-ca.com>, Paul Moore <paul@paul-moore.com>
References: <791e13b5-bebd-12fc-53de-e9a86df23836.ref@schaufler-ca.com>
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
 <53b07579-82f5-404e-5c2c-de7314fff327@I-love.SAKURA.ne.jp>
 <aa5424f3-05a6-530b-bf5f-19e5421f8f3f@canonical.com>
 <2c48a481-391f-85c7-be4f-13bbc1553aac@I-love.SAKURA.ne.jp>
 <AB202AC7-9C8D-4109-B4EA-87A7BC1BADF8@kernel.org>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <AB202AC7-9C8D-4109-B4EA-87A7BC1BADF8@kernel.org>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2022/10/31 1:37, Kees Cook wrote:
>> You have only three choices:
>>
>>  (1) allow assigning LSM ID integer value to all LSM modules (regardless of
>>      whether that module was merged into upstream kernel)
> 
> We are not hardware manufacturers.
> 

Excuse me? We are not talking about whether we are hardware manufacturers.
We are talking about the policy for assigning identifier.

I don't like how LSM IDs are assigned, for Casey said

  >> If the upstream kernel assigns an LSM id for all LSM modules including out-of-tree
  >> and/or private LSM modules (that's why I described that the upstream kernel behaves
  >> as if a DNS registerer), we can assign LSM id = 100 to "belllapadula" from A and
  >> LSM id = 101 to "belllapadula" from B, and both "belllapadula" modules can work
  >> without conflicts by using LSM id. Of course, this implies that we need to preserve
  >> unused space in lsm_idlist[LSMID_ENTRIES] etc. for such LSM modules (if we use
  >> fixed-sized array rather than a linked list).
  > 
  > Of course the upstream kernel isn't going to have LSM IDs for out-of-tree
  > security modules. That's one of many reasons loadable modules are going to
  > have to be treated differently from built-in modules, if they're allowed
  > at all.

at https://lkml.kernel.org/r/7263e155-9024-0508-370c-72692901b326@schaufler-ca.com and
Paul confirmed

  >> Currently anyone can start writing new LSM modules using name as identifier. But
  >> you are trying to forbid using name as identifier, and trying to force using integer
  >> as identifier, but that integer will not be provided unless new LSM modules get
  >> upstream.
  > 
  > That is correct.  In order to have a LSM identifier token the LSM must
  > be upstream.

at https://lkml.kernel.org/r/CAHC9VhT2Azg1F-G3RQ4xL7JgA3OAtHafzS1_nvUyEUFsCJ9+SA@mail.gmail.com .

If we can agree that the upstream kernel never refuse to assign LSM IDs to whatever
LSM modules, I'm OK that we introduce LSM ID integer value itself.



My next concern is that we are trying to use fixed sized capacity as LSMID_ENTRIES,
commented

  On 2022/10/13 19:04, Tetsuo Handa wrote:
  > On 2022/09/28 4:53, Casey Schaufler wrote:
  >> +	if (lsm_id > LSMID_ENTRIES)
  >> +		panic("%s Too many LSMs registered.\n", __func__);
  > 
  > I'm not happy with LSMID_ENTRIES. This is a way towards forever forbidding LKM-based LSMs.

at https://lkml.kernel.org/r/9907d724-4668-cd50-7454-1a8ca86542b0@I-love.SAKURA.ne.jp , for

  struct lsm_id *lsm_idlist[LSMID_ENTRIES] __lsm_ro_after_init;

may cause out-of-tree LSM modules to fail to use the slot.

It is a strange hack that users have to enable in-tree LSM modules or rewrite the
definition of LSMID_ENTRIES in order to use out-of-tree (either built-in or loadable)
LSM modules, for LSMID_ENTRIES is defined based on only in-tree LSM modules.

  #define LSMID_ENTRIES ( \
        1 + /* capabilities */ \
        (IS_ENABLED(CONFIG_SECURITY_SELINUX) ? 1 : 0) + \
        (IS_ENABLED(CONFIG_SECURITY_SMACK) ? 1 : 0) + \
        (IS_ENABLED(CONFIG_SECURITY_TOMOYO) ? 1 : 0) + \
        (IS_ENABLED(CONFIG_SECURITY_IMA) ? 1 : 0) + \
        (IS_ENABLED(CONFIG_SECURITY_APPARMOR) ? 1 : 0) + \
        (IS_ENABLED(CONFIG_SECURITY_YAMA) ? 1 : 0) + \
        (IS_ENABLED(CONFIG_SECURITY_LOADPIN) ? 1 : 0) + \
        (IS_ENABLED(CONFIG_SECURITY_SAFESETID) ? 1 : 0) + \
        (IS_ENABLED(CONFIG_SECURITY_LOCKDOWN) ? 1 : 0) + \
        (IS_ENABLED(CONFIG_BPF_LSM) ? 1 : 0) + \
        (IS_ENABLED(CONFIG_SECURITY_LANDLOCK) ? 1 : 0))

Although built-in out-of-tree LSM modules would be able to rewrite LSMID_ENTRIES definition
because users will rebuild the whole kernel, loadable out-of-tree LSM modules would not be
able to rewrite LSMID_ENTRIES definition because users will not rebuild the whole kernel.
It is still effectively a lock out for loadable out-of-tree LSM modules even if the problem
of assigning LSM ID integer value is solved.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

