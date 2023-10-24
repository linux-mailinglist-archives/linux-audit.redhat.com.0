Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDE87D5AF1
	for <lists+linux-audit@lfdr.de>; Tue, 24 Oct 2023 20:54:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698173650;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SG0mzR1Phqd3xlYyOhYr5GihMZqWBczXCI1T/MhORXw=;
	b=dd8cmFFyPFIJQoTHOSPJQ/NNeas+Z3XZzGgWkMCwRc/PDKP6Y1Kob6+sINqQfKwBMI6/La
	YZkZKrU/WscwdqzmiHxCOhfmnHapDyIjtqHdZ8FN5NDHLBUMOtPwdeyaCkWE/Gdvu/2G0L
	+iVTVdJSh7dB0S1CNO/8GHLbnyg2Klg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-7hbJ4ykPMDK82vytjRAoow-1; Tue, 24 Oct 2023 14:54:06 -0400
X-MC-Unique: 7hbJ4ykPMDK82vytjRAoow-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB02783FC63;
	Tue, 24 Oct 2023 18:54:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5C44B492BFC;
	Tue, 24 Oct 2023 18:53:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D313419465A3;
	Tue, 24 Oct 2023 18:53:54 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A91651946586 for <linux-audit@listman.corp.redhat.com>;
 Tue, 24 Oct 2023 18:53:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EA6792026D68; Tue, 24 Oct 2023 18:53:52 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.32.246])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC7722026D6E
 for <linux-audit@redhat.com>; Tue, 24 Oct 2023 18:53:52 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Audit status update
Date: Tue, 24 Oct 2023 14:53:52 -0400
Message-ID: <10525971.nUPlyArG6x@x2>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

Back in August I wrote an email detailing changes for an audit 4.0 release:
https://listman.redhat.com/archives/linux-audit/2023-August/020036.html

At this point, all changes have been made. I would like to ask anyone at a 
distribution to please pull the master branch and give it a try. It is 
suggested to package audit-rules, auditctl, and augenrule + the new systemd 
service separately. 

In order for the new audit-rules.service to be enabled out of the box, you 
will also need to coordinate a systemd preset. On Fedora, that would be:

 /usr/lib/systemd/system-preset/90-default.preset

which now includes:

enable auditd.service
enable audit-rules.service

I am aiming this change for Fedora 40 since that is the current one in 
development. Getting this enabled by default on Fedora requires a ticket and 
approval. I could imagine there are are similar procedures at other distros. 
Meaning when audit-4.0 is released, it may take some time before you see it 
in a distro.

The python updates required splitting libaudit.h into 2 files. The new file 
audit-logging.h is included by libaudit.h, so no user visible changes should 
be noticed.

Also, by restricting the API in the python bindings, I only know of one 
application that was relying on the extended API, setroubleshoot. Be on the 
lookout for other applications that might be broken.

The current master branch will be tagged as 4.0 alpha which is for testing. 
Please check this soon...because...the audit mail list might be going away 
soon. I am trying to preserve it but I think we are running out of time and 
options. If we lose the mail list, report items on github. And if I can 
arrange a new mail list, I will point to it from my people.redhat.com page.

Lastly, there is a new github branch, audit-3.1-maint. I have cherry-picked 
patches that I think are important for a 3.1.3 release if that ever happens. 
But know that I am not testing it and a release may never happen. Treat it 
more as a suggestion of patches you might want to include during any 
maintenance release you might do.

Please let me know any issues found in testing. Audit-4.0 will be released in 
the next month or so depending on feedback and FESCO approval.

Best Regards,
-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

