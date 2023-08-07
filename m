Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D3D772E3E
	for <lists+linux-audit@lfdr.de>; Mon,  7 Aug 2023 20:55:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691434504;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=b28uMMlQB6MfZVlMc5W/DHPfXP+U507WXjMuq9gAI6w=;
	b=Y5nuE+4y8qTZpb2UL79bl9HcAG24zRBz4CRm+f05rt3/3nY7z1sMmuQ1vQ27Yuv7olPKoS
	/6vf4Szc8/qd9fjmb8NRc6tdlniGUIcOoTv17G/f4CwCMeFZXwgGa70dY7mzeXEq8ZBvxZ
	Ty9SnYwUxtUC43HvbP4hnT4U27sDC48=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-f4UpYok0MUOA-DDrSblpmA-1; Mon, 07 Aug 2023 14:55:00 -0400
X-MC-Unique: f4UpYok0MUOA-DDrSblpmA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1972858290;
	Mon,  7 Aug 2023 18:54:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3166C140E950;
	Mon,  7 Aug 2023 18:54:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9D1DA194658F;
	Mon,  7 Aug 2023 18:54:30 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3F10F1946587 for <linux-audit@listman.corp.redhat.com>;
 Mon,  7 Aug 2023 18:54:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B20E6140E962; Mon,  7 Aug 2023 18:54:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.17.77])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B9E0140E950;
 Mon,  7 Aug 2023 18:54:25 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-security-module <linux-security-module@vger.kernel.org>,
 audit@vger.kernel.org, linux-audit@redhat.com,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Subject: Re: [PATCH v2] TaskTracker : Simplified thread information tracker.
Date: Mon, 07 Aug 2023 14:54:24 -0400
Message-ID: <2294714.ElGaqSPkdT@x2>
Organization: Red Hat
In-Reply-To: <ab7b4099-d238-e791-6dc2-25be5952798c@I-love.SAKURA.ne.jp>
References: <41d03271-ff8a-9888-11de-a7f53da47328@I-love.SAKURA.ne.jp>
 <2029076.tdWV9SEqCh@x2>
 <ab7b4099-d238-e791-6dc2-25be5952798c@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
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
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Monday, August 7, 2023 10:24:51 AM EDT Tetsuo Handa wrote:
> On 2023/08/07 7:01, Steve Grubb wrote:
> > This is where the problem begins. We like to have normalized audit
> > records. Meaning that a type of event defines the fields it contains. In
> > this case subject would be a process label. and there is already a
> > precedent for what fields belong in a syscall record.
> 
> What is the definition of "a process label"? SELinux / Smack / AppArmor are
> using security_secid_to_secctx() hook for providing string data for the
> subj= field. I don't think that they are restricting characters that can
> be included. Then, what is wrong with returning subset of ASCII printable
> characters from tt_secid_to_secctx() ?

Typically the label is used for access control decisions. But processes have 
other attributes such as a list of open files. I think adding this information 
will be useful - I'm not opposed to the idea. I am just thinking about how to 
present the information where it is more useful. 

<snip>

> > What I would suggest is to make a separate record: AUDIT_PROC_TREE that
> > describes process tree from the one killed up to the last known parent.
> > This way you can define your own format and SYSCALL can stay as everyone
> > expects it to look. In the EXECVE audit record, there is a precedent of
> > using agv[0]=xx argv[1]=xx argv[2]=yy  and so on. If you want to make
> > these generally parsable without special knowledge of the record format,
> > I'd suggest something like it.
> 
> Yes,
> https://lkml.kernel.org/r/201501202220.DJJ34834.OLJOHFMQOFtSVF@I-love.SAKU
> RA.ne.jp used AUDIT_PROCHISTORY instead of LSM hooks, but that thread died
> there.

I do not read that mail list. AUDIT_PROC_HIST or AUDIT_PROC_CHAIN or some 
thing like that would be the better way to go. If someone wanted to see if 
they have process history for a segfault, how would they do it with the 
proposed record?

ausearch --subject sshd

That just doesn't seem right. If you had a record dedicated to this 
information, then you can do:

ausearch -m PROC_HIST

and it would give you that information. And if you had the data split up 
like: p[0]=xx p[1]=xx p[2]=yy

Then  someone could do this to make a report specific to this:

import auparser as aup
au = aup.AuParser(aup.AUSOURCE_FILE, "audit.log")

au.search_add_expression("type r= PROC_HIST", aup.AUSEARCH_RULE_CLEAR)
au.search_set_stop(aup.AUSEARCH_STOP_RECORD)
while au.search_next_event():
    print("Call chain: ", end="")
    while True:
        print(au.interpret_field(), end = "")
        if au.next_field() == False:
            break
        print("->", end="")

au = None
sys.exit(0)

This would be more programmer friendly.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

