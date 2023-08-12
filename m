Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B1508779ECA
	for <lists+linux-audit@lfdr.de>; Sat, 12 Aug 2023 12:08:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691834925;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rMLZaw61Fr/zsonYDNLJsNSf3TAol0qivUFYv/IQkLU=;
	b=VvRUI2dno1v21EEx1T/rM4mcNedJAGI+VjbWyR5hlaS7Q/rlPFyx1Eq2xxEqA+owObz/Pc
	KfNAFXTbOthi401ylYTc+mNqF+R9EbWzOcPTrhRvbU0tg2VP5ha4uFZhXyGilSWXd4JMyY
	xsimVHbcxb4/zZns9roBZsuL4MCZljo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-yibLEn8_NeOnIORFXHrfww-1; Sat, 12 Aug 2023 06:08:42 -0400
X-MC-Unique: yibLEn8_NeOnIORFXHrfww-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6432101A528;
	Sat, 12 Aug 2023 10:08:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D3540492C13;
	Sat, 12 Aug 2023 10:08:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C4CD019465A4;
	Sat, 12 Aug 2023 10:08:30 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2D202194658F for <linux-audit@listman.corp.redhat.com>;
 Sat, 12 Aug 2023 10:08:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DEA69140E97B; Sat, 12 Aug 2023 10:08:28 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D6148140E97A
 for <linux-audit@redhat.com>; Sat, 12 Aug 2023 10:08:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6A238DC668
 for <linux-audit@redhat.com>; Sat, 12 Aug 2023 10:08:28 +0000 (UTC)
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-pRTlDc8rOEKAlZDV5rr4uw-1; Sat, 12 Aug 2023 06:08:21 -0400
X-MC-Unique: pRTlDc8rOEKAlZDV5rr4uw-1
Received: from fsav311.sakura.ne.jp (fsav311.sakura.ne.jp [153.120.85.142])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 37CA8B8Y030980;
 Sat, 12 Aug 2023 19:08:11 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav311.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav311.sakura.ne.jp);
 Sat, 12 Aug 2023 19:08:11 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav311.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 37CA8BCE030977
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 12 Aug 2023 19:08:11 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <35fb916d-7233-31a8-8d1f-e64a623de337@I-love.SAKURA.ne.jp>
Date: Sat, 12 Aug 2023 19:08:09 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] audit: add task history record
To: Richard Guy Briggs <rgb@redhat.com>
References: <36b65eb1-ccbf-8b81-468f-b8d88c4be5a3@I-love.SAKURA.ne.jp>
 <ZNZ082CR0oLfuiqo@madcap2.tricolour.ca>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <ZNZ082CR0oLfuiqo@madcap2.tricolour.ca>
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
Cc: audit@vger.kernel.org,
 linux-security-module <linux-security-module@vger.kernel.org>,
 linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: i-love.sakura.ne.jp
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2023/08/12 2:50, Richard Guy Briggs wrote:
> On 2023-08-11 19:58, Tetsuo Handa wrote:
>> When an unexpected system event occurs, the administrator may want to
>> identify which application triggered the event. For example, unexpected
>> process termination is still a real concern enough to write articles
>> like https://access.redhat.com/solutions/165993 .
>>
>> This patch adds a record which emits TOMOYO-like task history information
>> into the audit logs for better understanding of unexpected system events.
>>
>>   type=UNKNOWN[1340] msg=audit(1691750738.271:108): history="name=swapper/0;pid=1;start=20230811194329=>name=init;pid=1;start=20230811194343=>name=systemd;pid=1;start=20230811194439=>name=sshd;pid=3660;start=20230811104504=>name=sshd;pid=3767;start=20230811104535"
>>
>> To be able to avoid bloating audit log files due to this information, this
>> patch uses audit_history= kernel command line parameter that controls max
>> length of history in bytes (default is 1024, and setting to 0 disables
>> recording and emitting).
> 
> The record length limit is just below 8k.  Is it reasonable to set the
> default at 4k and cap it around 7.5k to be safe?

Below will do it. (I though default at 0 might be better...)

+static unsigned int audit_history_size __ro_after_init = 4096;
+char init_task_audit_history[7680];
+static int __init audit_history_setup(char *str)
+{
+	unsigned int size;
+
+	if (kstrtouint(str, 10, &size))
+		return -EINVAL;
+	if (size > sizeof(init_task_audit_history))
+		size = sizeof(init_task_audit_history);
+	audit_history_size = size;
+	return 0;
+}

> 
> Is proctitle also useful here?  It contains the full command line, but
> is influencible by userspace.

Full pathname is max 4096 bytes. But full command line effectively has no
limit, which might become very long. Shouldn't full command line arguments
be retrieved from execve()'s argv[] record? Since this history information
includes timestamp of execve(), also recording execve() requests will allow
administrators to find the full command line.

>> Unlike execve()'s argv record, records in this history information is
>> emitted as one string in order to reduce bloat of the audit log files.
>> This information can be split into an array using => as the tokenizer.
>> But don't expect that you can compare array elements throughout the whole
>> audit logs by splitting into an array, for old records get removed from
>> history when history became too long to append the newest record. This
>> history information is meant to be interpreted by humans rather than be
>> analyzed by programs.
> 
> You say this isn't intended to be analysed by programs, but we all know
> it will inevitably be attempted...  Would any of the descendants of
> audit_log_untrustedstring() be of use, in particular
> audit_string_contains_control()

I couldn't catch what you are suggesting. Are you suggesting something like

  type=UNKNOWN[1340] msg=audit(1691750738.271:108):
    n[$n]="swapper/0" n[$n+1]="init" n[$n+2]="systemd" n[$n+3]="sshd" n[$n+4]="sshd"
    p[$n]=1 p[$n+1]=1 p[$n+2]=1 p[$n+3]=3660 p[$n+4]=3767
    s[$n]=20230811194329 s[$n+1]=20230811194343 s[$n+2]=20230811194439 s[$n+3]=20230811104504 s[$n+4]=20230811104535

so that value for n[$n] is escaped only when control characters are in use?

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

