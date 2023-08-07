Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 240887727A0
	for <lists+linux-audit@lfdr.de>; Mon,  7 Aug 2023 16:25:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691418329;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Tmhfn+GrnzWvMHzzQTIvbtCmNgcjGJEtfwzI2+KZsJo=;
	b=fLjrM/79lRkURF0ZrL42keq403g9URT37CbUDkdAAMPamqSabEpo8kWMeM0H9/9PQiXMys
	zFPNZWGgGJjWRiBvi2Ovw5Pkc3bya1Ocumo0ilZWHE6nd+fMb5kpkPzA/XVGciqjunbl9w
	MsIqRhQbsUavjwm0itW02jhIbhGkKuU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-2uKXSQgGMfupVwg5BKPHfg-1; Mon, 07 Aug 2023 10:25:27 -0400
X-MC-Unique: 2uKXSQgGMfupVwg5BKPHfg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3F0B8DC664;
	Mon,  7 Aug 2023 14:25:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CFD4E492C13;
	Mon,  7 Aug 2023 14:25:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 36953194658F;
	Mon,  7 Aug 2023 14:25:15 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4573F1946586 for <linux-audit@listman.corp.redhat.com>;
 Mon,  7 Aug 2023 14:25:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3006C403169; Mon,  7 Aug 2023 14:25:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 28F834021AD
 for <linux-audit@redhat.com>; Mon,  7 Aug 2023 14:25:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08C9285CCE3
 for <linux-audit@redhat.com>; Mon,  7 Aug 2023 14:25:13 +0000 (UTC)
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-onMxUgIaMgWpIaIk65V_Yg-1; Mon, 07 Aug 2023 10:25:10 -0400
X-MC-Unique: onMxUgIaMgWpIaIk65V_Yg-1
Received: from fsav314.sakura.ne.jp (fsav314.sakura.ne.jp [153.120.85.145])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 377EP63N094543;
 Mon, 7 Aug 2023 23:25:06 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav314.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav314.sakura.ne.jp);
 Mon, 07 Aug 2023 23:25:06 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav314.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 377EOsHZ094511
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 7 Aug 2023 23:25:06 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <ab7b4099-d238-e791-6dc2-25be5952798c@I-love.SAKURA.ne.jp>
Date: Mon, 7 Aug 2023 23:24:51 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2] TaskTracker : Simplified thread information tracker.
To: Steve Grubb <sgrubb@redhat.com>,
 linux-security-module <linux-security-module@vger.kernel.org>,
 audit@vger.kernel.org, linux-audit@redhat.com
References: <41d03271-ff8a-9888-11de-a7f53da47328@I-love.SAKURA.ne.jp>
 <2029076.tdWV9SEqCh@x2>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <2029076.tdWV9SEqCh@x2>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

On 2023/08/07 7:01, Steve Grubb wrote:
> This is where the problem begins. We like to have normalized audit records. 
> Meaning that a type of event defines the fields it contains. In this case 
> subject would be a process label. and there is already a precedent for what 
> fields belong in a syscall record.

What is the definition of "a process label"? SELinux / Smack / AppArmor are using
security_secid_to_secctx() hook for providing string data for the subj= field.
I don't think that they are restricting characters that can be included.
Then, what is wrong with returning subset of ASCII printable characters from
tt_secid_to_secctx() ?



static int selinux_secid_to_secctx(u32 secid, char **secdata, u32 *seclen)
{
	return security_sid_to_context(secid,
				       secdata, seclen);
}

static int smack_secid_to_secctx(u32 secid, char **secdata, u32 *seclen)
{
	struct smack_known *skp = smack_from_secid(secid);

	if (secdata)
		*secdata = skp->smk_known;
	*seclen = strlen(skp->smk_known);
	return 0;
}

int apparmor_secid_to_secctx(u32 secid, char **secdata, u32 *seclen)
{
	/* TODO: cache secctx and ref count so we don't have to recreate */
	struct aa_label *label = aa_secid_to_label(secid);
	int flags = FLAG_VIEW_SUBNS | FLAG_HIDDEN_UNCONFINED | FLAG_ABS_ROOT;
	int len;

	AA_BUG(!seclen);

	if (!label)
		return -EINVAL;

	if (apparmor_display_secid_mode)
		flags |= FLAG_SHOW_MODE;

	if (secdata)
		len = aa_label_asxprint(secdata, root_ns, label,
					flags, GFP_ATOMIC);
	else
		len = aa_label_snxprint(NULL, 0, root_ns, label, flags);

	if (len < 0)
		return -ENOMEM;

	*seclen = len;

	return 0;
}

> 
> What I would suggest is to make a separate record: AUDIT_PROC_TREE that 
> describes process tree from the one killed up to the last known parent. This 
> way you can define your own format and SYSCALL can stay as everyone expects it 
> to look. In the EXECVE audit record, there is a precedent of using agv[0]=xx 
> argv[1]=xx argv[2]=yy  and so on. If you want to make these generally 
> parsable without special knowledge of the record format, I'd suggest 
> something like it.

Yes, https://lkml.kernel.org/r/201501202220.DJJ34834.OLJOHFMQOFtSVF@I-love.SAKURA.ne.jp
used AUDIT_PROCHISTORY instead of LSM hooks, but that thread died there.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

