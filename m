Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C032B9EB3B
	for <lists+linux-audit@lfdr.de>; Tue, 27 Aug 2019 16:39:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D340FC028320;
	Tue, 27 Aug 2019 14:39:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D1FF5D9CC;
	Tue, 27 Aug 2019 14:39:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CE68124F30;
	Tue, 27 Aug 2019 14:39:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7REdNLU025392 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 27 Aug 2019 10:39:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 694F360127; Tue, 27 Aug 2019 14:39:23 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63C01600D1
	for <linux-audit@redhat.com>; Tue, 27 Aug 2019 14:39:20 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 61A13C05168C
	for <linux-audit@redhat.com>; Tue, 27 Aug 2019 14:39:19 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id d23so17207605qko.3
	for <linux-audit@redhat.com>; Tue, 27 Aug 2019 07:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=from:subject:to:date:message-id:user-agent:mime-version
	:content-transfer-encoding;
	bh=J49H93kAawjsacz46cK4498b4uSdEx10UceGmyxXmqE=;
	b=1QJwRLNNHSw11fBqoFfYT6otV48gfDTSeXonHy5IJd+TjlmrW5QKsIJee7tgN/hVxq
	8y9rjq91tc6o0pDJ8/KPaB5b0P7HuXpKuOkBRHf+Sn5FmHsbIn0yAtoPcvVQKKw+EFjC
	dcsDCxLhBUCeFn5qAfEQHgbWP8qOF69xWs0iXhFJVi0vorwfHge3E7ZmqTF7Kh8xAgN+
	bVRsNIxIBnBmZVStCYWPAZkoc8F9qARf3ceTtZCPHFjKr9Z4Eves8sSEHAv/mtS6bqmY
	QBlGpt88WLl+8XvaRBaXTFJOJ/NsWFMMTM4FqF1jvUR6jl/nB5n0Mgy9Sdn+a1AFhEt2
	9S2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:date:message-id:user-agent
	:mime-version:content-transfer-encoding;
	bh=J49H93kAawjsacz46cK4498b4uSdEx10UceGmyxXmqE=;
	b=kOV/nExIuwIfkWrFcVsi0fbMjpu7Rm6y2SVh02cffo8DGmD8BlYfGC57GWK+woVQd7
	CG2/g7Fpncm+N0EMX1SmZfEYP+dtMzGreOw95lRNHEr9liyoc0cIhdPI810VMrCRN5ng
	edm6QuTin1OfikL0hopqdcscfCb4tH9cboLoslSljIhrkQqRfCTp2SaEIocKJAVKQ1fy
	N7/Wcx3cuLoZkgCeNIBW3V1aW1EtmZhmEFFt/+RM49hj93lmISsA9dGBe9rptSPYLi5l
	iEz6Y7mU1aHYPLuopicozOOA5UXBmz/To7gTT/AZCwkLi+sIB5uAWAIKwlIA6yMlqucz
	wNGA==
X-Gm-Message-State: APjAAAUqLMiLMnYf2bsKEJKrGNqPoGW3FCmUfl8bIyFMhn5zN1j5lFJM
	3fZwgS9mrtU//wSseYWw/3gs1tBVmQ==
X-Google-Smtp-Source: APXvYqwXaZT59adKoS0QcdWxg8dXZFJNLiiuKi/Y0fRVIK5OZZNklZlqS5ElzRrs8Pty5ccAs3OYpg==
X-Received: by 2002:a37:6146:: with SMTP id v67mr21510363qkb.493.1566916757954;
	Tue, 27 Aug 2019 07:39:17 -0700 (PDT)
Received: from localhost (static-96-233-112-89.bstnma.ftas.verizon.net.
	[96.233.112.89]) by smtp.gmail.com with ESMTPSA id
	h66sm8683592qke.61.2019.08.27.07.39.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 27 Aug 2019 07:39:17 -0700 (PDT)
From: Paul Moore <paul@paul-moore.com>
X-Google-Original-From: Paul Moore <pmoore2@cisco.com>
Subject: [PATCH] audit-testsuite: update the docs for Debian SID/unstable
To: linux-audit@redhat.com
Date: Tue, 27 Aug 2019 10:39:16 -0400
Message-ID: <156691675641.16819.16469111001334328114.stgit@chester>
User-Agent: StGit/0.19-dirty
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 27 Aug 2019 14:39:19 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Tue, 27 Aug 2019 14:39:19 +0000 (UTC) for IP:'209.85.222.196'
	DOMAIN:'mail-qk1-f196.google.com'
	HELO:'mail-qk1-f196.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.222.196 mail-qk1-f196.google.com 209.85.222.196
	mail-qk1-f196.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Tue, 27 Aug 2019 14:39:38 +0000 (UTC)

From: Paul Moore <paul@paul-moore.com>

Updates include additional packages and instructions on changing
/bin/sh from Dash to BASH.

Signed-off-by: Paul Moore <paul@paul-moore.com>
---
 README.md |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/README.md b/README.md
index bc20a21..0f6c861 100644
--- a/README.md
+++ b/README.md
@@ -52,12 +52,23 @@ please follow the instructions below.
 
 ### Debian Based Systems
 
+On Debian you need to install a number of dependencies as well as perform some
+additional system configuration.  Install the dependencies using the commands
+below:
+
 	# apt-get install auditd \
 	                  build-essential \
 	                  libc6-i386 \
+	                  libc6-dev-i386 \
 	                  perl-modules \
 	                  netcat
 
+After the dependencies are installed you should ensure that BASH is installed
+on the system and that /bin/sh points to BASH, not Dash:
+
+	# apt-get install bash
+	# dpkg-reconfigure dash
+
 ## Execution
 
 Please notice that tests are changing kernel audit rules and hence it might be

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
