Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DA970FEE8
	for <lists+linux-audit@lfdr.de>; Wed, 24 May 2023 22:02:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684958520;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CeRmDCgkdqaAWxiYAL4f2vSz5IdAL0UEmlic6d8R4H0=;
	b=IGXOzSXxeTUo2K8RTgDtvgPhYTeT7Fk/Sy+ijejG95pqzGc9QP5I3R1ofztXu4HPs+ERVi
	eNSJIzQLuf1Eb/37Nuo+E+gL5+tHuW/0BqH2mIeFVF1o/a0XHIBpkk9CaOUtlHKcVx5Jew
	rk4jWG/FvWY9O/z/dqodNQ2F6buV0I8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-ceBXC04VMuWnrbkQB3gXng-1; Wed, 24 May 2023 16:01:56 -0400
X-MC-Unique: ceBXC04VMuWnrbkQB3gXng-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E494800888;
	Wed, 24 May 2023 20:01:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 30FFA7AF5;
	Wed, 24 May 2023 20:01:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7C45419465B9;
	Wed, 24 May 2023 20:01:51 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 387D219465A0 for <linux-audit@listman.corp.redhat.com>;
 Wed, 24 May 2023 20:01:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 16715140E961; Wed, 24 May 2023 20:01:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.22.50.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 77B36140E95D;
 Wed, 24 May 2023 20:01:49 +0000 (UTC)
Date: Wed, 24 May 2023 16:01:47 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Steve Grubb <sgrubb@redhat.com>
Subject: Re: No more report of quantity of rules successfully loaded
Message-ID: <ZG5tKxgzVJLxSZm9@madcap2.tricolour.ca>
References: <CAJdJdQnpmK3uN7R_CNQs3+HdLKfswgQpqT95+O0_Bawc7zMKHw@mail.gmail.com>
 <4811240.GXAFRqVoOG@x2>
MIME-Version: 1.0
In-Reply-To: <4811240.GXAFRqVoOG@x2>
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
Cc: Linux Audit <linux-audit@redhat.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2023-05-24 10:42, Steve Grubb wrote:
> Hello Warron,
> 
> On Tuesday, May 23, 2023 7:12:07 PM EDT warron.french wrote:
> > Hi, I am running auditd-3.0.7-4 on an Alma Linux v8.8.
> > 
> > I know that for all of RHEL 6 and RHEL 7 variants that I worked with, to
> > include CentOS (not Stream) that after I rebooted a server or restarted the
> > auditd service (with -e 1 set) that I would 100% of the time get a report
> > in /var/log/messages about the quantity of rules that successfully loaded.
> 
> It has never done that unless someone else has a patch they did not send 
> upstream.
> 
> > I could compare that to my unified rules file
> > (/etc/audit/rules.d/Unified.rules - for a reference) and strip out the
> > typical for auditd Control rules (-D, -e 1, -f 1, -b, -r, for examples) and
> > then assess if I had the full set of files loaded or not.
> > 
> > With this implementation of auditd, on version 3.0.7-4, I am not getting
> > those results anymore.
> > Am I looking in the wrong place, because for me this is important
> > information?
> 
> It has never done that. auditctl -D gives the output of auditctl -s as a 
> convenience. But auditctl -s has never reported how many rules are loaded. I 
> don't think the kernel has a counter. It has a variable for if any rules are 
> loaded, but not the quantity.

Minor correction: there is a kernel variable (audit_n_rules) that counts
the number of syscall rules in place, but it isn't reported directly
outside the kernel.  This feeds the boolean (struct
audit_context)->dummy.

> > Yes, I know that I can also manually execute "auditctl -l  | wc -l" and get
> > that information  too, but I was wondering if this is planned or if I am
> > looking in the wrong place, or what to do.
> 
> It has never done that and is not planned.
> 
> -Steve

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635
--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

