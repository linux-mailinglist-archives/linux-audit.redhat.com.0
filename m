Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2870477399A
	for <lists+linux-audit@lfdr.de>; Tue,  8 Aug 2023 12:25:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691490354;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vOje5BBFQm0QizSTs9s1es6xwYQBzYwefg1mTJt95f0=;
	b=eC248uzi32KuKyWFKkTAdhPsKMAdykNu93oZMyeCj/79R/M3QMzvdzhM7sOB8FPOy16HjZ
	UFsMVMIi+njF9eSm2mflS/VoxP8rPcAHw5E6pe8rquhRREFBgzzWKcs2XRXZctH3e7StRy
	U8QdiDG4f8bJnSNcDdx1fbbgmk1L/58=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-PZh5VxwdNYiC6wfCukV-lA-1; Tue, 08 Aug 2023 06:25:50 -0400
X-MC-Unique: PZh5VxwdNYiC6wfCukV-lA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DCF9800C78;
	Tue,  8 Aug 2023 10:25:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 49480492C18;
	Tue,  8 Aug 2023 10:25:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E17A11946595;
	Tue,  8 Aug 2023 10:25:46 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 02E211946586 for <linux-audit@listman.corp.redhat.com>;
 Tue,  8 Aug 2023 10:25:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 91722492C14; Tue,  8 Aug 2023 10:25:45 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89944492C13
 for <linux-audit@redhat.com>; Tue,  8 Aug 2023 10:25:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A7F88022E4
 for <linux-audit@redhat.com>; Tue,  8 Aug 2023 10:25:45 +0000 (UTC)
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-VbXg6yQvOLOEn7dk_u9Qew-1; Tue, 08 Aug 2023 06:25:43 -0400
X-MC-Unique: VbXg6yQvOLOEn7dk_u9Qew-1
Received: from fsav113.sakura.ne.jp (fsav113.sakura.ne.jp [27.133.134.240])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 378APexv059107;
 Tue, 8 Aug 2023 19:25:40 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav113.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav113.sakura.ne.jp);
 Tue, 08 Aug 2023 19:25:40 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav113.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 378APdoI059104
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 8 Aug 2023 19:25:40 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <025aa551-7ed7-d413-26e3-222ac12e9345@I-love.SAKURA.ne.jp>
Date: Tue, 8 Aug 2023 19:25:39 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2] TaskTracker : Simplified thread information tracker.
To: Steve Grubb <sgrubb@redhat.com>,
 linux-security-module <linux-security-module@vger.kernel.org>,
 audit@vger.kernel.org, linux-audit@redhat.com
References: <41d03271-ff8a-9888-11de-a7f53da47328@I-love.SAKURA.ne.jp>
 <2029076.tdWV9SEqCh@x2>
 <ab7b4099-d238-e791-6dc2-25be5952798c@I-love.SAKURA.ne.jp>
 <2294714.ElGaqSPkdT@x2>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <2294714.ElGaqSPkdT@x2>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: i-love.sakura.ne.jp
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2023/08/08 3:54, Steve Grubb wrote:
>>> What I would suggest is to make a separate record: AUDIT_PROC_TREE that
>>> describes process tree from the one killed up to the last known parent.
>>> This way you can define your own format and SYSCALL can stay as everyone
>>> expects it to look. In the EXECVE audit record, there is a precedent of
>>> using agv[0]=xx argv[1]=xx argv[2]=yy  and so on. If you want to make
>>> these generally parsable without special knowledge of the record format,
>>> I'd suggest something like it.
>>
>> Yes,
>> https://lkml.kernel.org/r/201501202220.DJJ34834.OLJOHFMQOFtSVF@I-love.SAKU
>> RA.ne.jp used AUDIT_PROCHISTORY instead of LSM hooks, but that thread died
>> there.
> 
> I do not read that mail list. AUDIT_PROC_HIST or AUDIT_PROC_CHAIN or some 
> thing like that would be the better way to go. If someone wanted to see if 
> they have process history for a segfault, how would they do it with the 
> proposed record?

Avoid bloating of audit log files could be done when saving into audit log
files, but avoiding overhead of tracking/recording this history information
would need to be done using kernel command line options.

Is there a kernel command line option that can configure whether to include
(and what to be included into) this history information or not?

If an LSM is used, a kernel command line option like lsm=tt can be used for
telling the kernel to include this history information and kernel command
line options like tt.size=512 tt.fields=name,stamp for telling the kernel
max history length and fields to include.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

