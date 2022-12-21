Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 170B76539E7
	for <lists+linux-audit@lfdr.de>; Thu, 22 Dec 2022 00:50:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671666628;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=71wskPs6+lpCgY+udlK1piM+30yvvIpGVNoTVz9DOVY=;
	b=QziDMVgbvHIOEZlEcbKVlTE/azUoh3XnD4diZDnAC2SZsSj3RUNAQdnpoZ296uE25L+Ctf
	2Qmy73fTdXEbRjyZAJZCcohfGI5Jh9KAezq+YWC1yccvLqnD/CwsWAYWGtuiyCw+vVFUVX
	+QX6qiHKv+8jN4kiRF7xpG9xiGLTsp8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-TV6I4QgDNgSiYZxFCKyuzg-1; Wed, 21 Dec 2022 18:50:25 -0500
X-MC-Unique: TV6I4QgDNgSiYZxFCKyuzg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 557AB38041C7;
	Wed, 21 Dec 2022 23:50:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 086D714152F6;
	Wed, 21 Dec 2022 23:50:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9124E19465B7;
	Wed, 21 Dec 2022 23:50:21 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2AFEE19465A8 for <linux-audit@listman.corp.redhat.com>;
 Wed, 21 Dec 2022 23:50:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DC6B3112132D; Wed, 21 Dec 2022 23:50:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D4E68112132C
 for <linux-audit@redhat.com>; Wed, 21 Dec 2022 23:50:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2945238041C1
 for <linux-audit@redhat.com>; Wed, 21 Dec 2022 23:50:19 +0000 (UTC)
Received: from icp-osb-irony-out8.external.iinet.net.au
 (icp-osb-irony-out8.external.iinet.net.au [203.59.1.225]) by
 relay.mimecast.com with ESMTP id us-mta-436--cbMw18nP2K8-rJUva7fhQ-1; Wed,
 21 Dec 2022 18:50:16 -0500
X-MC-Unique: -cbMw18nP2K8-rJUva7fhQ-1
IronPort-SDR: sz6t/4FPc01RbLWL3W/rSZSyg3rOhpFFnrZ9OBvZleRuxibcCw+jP/gDah/7lkWHnXgR1apOkQ
 QAuQnJpR5/YqVwNg4tq2r1ZA9nMaHY9qVrmaumI0irQZtgLNG6g/tsyqyKACN2YYLAsaf0SyvM
 F1/a0nSdKM1D7MBIElYeLSvWjNTjlkHbBzsskZSd/9gZ9vMBFHIghk7yMxt/hGqn8vzuQ3a69V
 HbDjp1zYRjMzD3Xxk6W4ms243POlYnIiIfWxlQaWTp1KYovusfDOgguoAXsoKtkZKYGpkllv/Y
 Wic=
X-SMTP-MATCH: 1
IronPort-Data: A9a23:a8a07Kx2IFitmV4GZa96t+eoxCrEfRIJ4+MujC+fZmUNrF6WrkU3e
 hirod39jgY+HhL3funC5f239Uo2DfZgF+fXKXJsnZ1XZysiRfHtWJLIcC8cAwvIdpeZFRg9t
 p1FAjX9BJtcokH090/F3ofJ8CEUOZGgHtIQ38adZ0id7Sc9IMsQoUoLd9wR2+aEsvDga++5g
 u4eluWEULOTN5+YBUpPg06LgEsHUP3a5GhC5gRmDRxBlAe2e3I9VPrzKYntdCGgGtE88uOSH
 47+IL+FEmzx7Uk1SdS4ma7HKUwGWr70JUve1SoRYv336vRCjnRaPqcTL+UAZwFMlCmH2dxgz
 tlLrtq3UwhB0q/kwr1MFUgAVXguYOsfoeCvzXuX6KR/y2XMbmHqhfxqEEAwMqUZ++B6HSdI+
 OBeIS1lghWr277pmerrE7k27iglBMz7LYAAnn5y92/EMao4WY+cRYPO6cANiV/cgegLR54yf
 fExcTNyaDzYagBLf1IQD4gz2uyvgxHXaDJCtVifjbA672ja0Ep6172FGN7UfMGaAMxIkkeEj
 njL82TwHlcRM9n39Nae2ij116qexWaiCN9XTeTnsP9yxlSfz2lVAxoTE1KmyRWktnODtxtkA
 xR80kITQWIarxDDogXVN/FgnEO5gw==
IronPort-HdrOrdr: A9a23:Vu95zamT9n8gFVnrNFTL2AhaeUbpDfIf3DAbv31ZSRFFG/Fxr6
 uV7ZAmPH7P+VQssRQb8rq90ca7LE80iqQFmLX5UY3PYOCEghrKEGgB1+rfKlTbckXDH4hmup
 uIGJIfNDSfNzZHZeGQ2njcLz4aq+P3l5xBvIzlvhFQpAhRGtld0zs=
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; 
 d="scan'208,217";a="447108182"
Received: from 219-90-185-117.ip.adam.com.au (HELO swtf.swtf.dyndns.org)
 ([219.90.185.117])
 by icp-osb-irony-out8.iinet.net.au with ESMTP; 22 Dec 2022 07:49:58 +0800
Message-ID: <fcbc45f170fa7b45fd441f597e4b9203e17ae2a7.camel@iinet.net.au>
Subject: Re: BPF audit logs
From: Burn Alting <burn.alting@iinet.net.au>
To: Paul Moore <paul@paul-moore.com>
Date: Thu, 22 Dec 2022 10:49:57 +1100
In-Reply-To: <CAHC9VhSL4NYNXuc629b=CzDzLqg67T-mjp3hiiet_JfzPYC1ug@mail.gmail.com>
References: <df1eacecc605f856fa80d66d81eddea4dc70ce56.camel@iinet.net.au>
 <5652312.DvuYhMxLoT@x2>
 <602700a68fa5b8d68baef4368eaa5e8adf3799a3.camel@iinet.net.au>
 <CAHC9VhSNq5xzpB2jzxK5oFQAM2uGefihCYH0iq91=0Lm=D8jig@mail.gmail.com>
 <CAHC9VhTTnhT5pwpa4jjbE+2fTc1aO5oAiVoP9ERm-khC+EkLMQ@mail.gmail.com>
 <36184353421ebef0ee90653ecc71e1a80d9a0040.camel@swtf.dyndns.org>
 <CAHC9VhSL4NYNXuc629b=CzDzLqg67T-mjp3hiiet_JfzPYC1ug@mail.gmail.com>
Mime-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
Reply-To: burn@swtf.dyndns.org
Cc: Linux-Audit Mailing List <linux-audit@redhat.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============0180914956741928383=="

--===============0180914956741928383==
Content-Type: multipart/alternative; boundary="=-DikXbprveD6mvoKXNxl3"

--=-DikXbprveD6mvoKXNxl3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2022-12-21 at 18:40 -0500, Paul Moore wrote:
> On Wed, Dec 21, 2022 at 4:03 PM Burn Alting <burn@swtf.dyndns.org> wrote:
> > As Steve suggests, it would have value to provide more information (name, tag,
> > uid) and I don't know if it's possiblebut relate it to the bpf syscall's file
> > descriptor for the map created or program loaded (the exit value).
> 
> I'm primarily focused on the bogus ID during load, as that is anobvious regression
> that needs to be addressed as soon as possible.For various backport/support
> reasons, I don't want to combine the bugfix with the feature enhancement of adding
> new fields.

Ack.

--=-DikXbprveD6mvoKXNxl3
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>On Wed, 2022-12-21 at 18:40 -0500, Paul Moore wrote:</div><blockqu=
ote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid=
;padding-left:1ex"><pre>On Wed, Dec 21, 2022 at 4:03 PM Burn Alting &lt;</p=
re><a href=3D"mailto:burn@swtf.dyndns.org"><pre>burn@swtf.dyndns.org</pre><=
/a><pre>&gt; wrote:</pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .8=
ex; border-left:2px #729fcf solid;padding-left:1ex"><pre>As Steve suggests,=
 it would have value to provide more information (name, tag, uid) and I don=
't know if it's possible</pre><pre>but relate it to the bpf syscall's file =
descriptor for the map created or program loaded (the exit value).</pre></b=
lockquote><pre><br></pre><pre>I'm primarily focused on the bogus ID during =
load, as that is an</pre><pre>obvious regression that needs to be addressed=
 as soon as possible.</pre><pre>For various backport/support reasons, I don=
't want to combine the bug</pre><pre>fix with the feature enhancement of ad=
ding new fields.</pre></blockquote><div><br></div><div>Ack.</div></body></h=
tml>

--=-DikXbprveD6mvoKXNxl3--

--===============0180914956741928383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============0180914956741928383==--

