Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id C34B023BA08
	for <lists+linux-audit@lfdr.de>; Tue,  4 Aug 2020 13:58:38 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-lWDbtI7cPF-9rFi71ldtsw-1; Tue, 04 Aug 2020 07:58:35 -0400
X-MC-Unique: lWDbtI7cPF-9rFi71ldtsw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 955A71DE0;
	Tue,  4 Aug 2020 11:58:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5271F71769;
	Tue,  4 Aug 2020 11:58:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5B3E91809561;
	Tue,  4 Aug 2020 11:58:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 073ND2kn018444 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 3 Aug 2020 19:13:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 315072166BA4; Mon,  3 Aug 2020 23:13:02 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D78C2166B28
	for <linux-audit@redhat.com>; Mon,  3 Aug 2020 23:12:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38D4B1049845
	for <linux-audit@redhat.com>; Mon,  3 Aug 2020 23:12:59 +0000 (UTC)
Received: from master.debian.org (master.debian.org [82.195.75.110]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-301-JviAQO4uOQaJ6T58KPPISg-1; Mon, 03 Aug 2020 19:12:56 -0400
X-MC-Unique: JviAQO4uOQaJ6T58KPPISg-1
Received: from guillem by master.debian.org with local (Exim 4.92)
	(envelope-from <guillem@master.debian.org>) id 1k2jIH-0005Zd-0C
	for linux-audit@redhat.com; Mon, 03 Aug 2020 22:50:57 +0000
Date: Tue, 4 Aug 2020 00:50:49 +0200
From: Guillem Jover <guillem@debian.org>
To: linux-audit@redhat.com
Subject: Adding audit support to dpkg
Message-ID: <20200803225049.GA511687@thunder.hadrons.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 073ND2kn018444
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 04 Aug 2020 07:56:04 -0400
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Content-Disposition: inline

SGkhCgpXZSBnb3QgYSByZXF1ZXN0IHRvIGFkZCBhdWRpdCBzdXBwb3J0IHRvIGRwa2cgW1JdLCBh
bmQgYXMgaW5pdGlhbGx5Cm1lbnRpb25lZCBvbiB0aGUgYnVnIHJlcG9ydCBpdCBzZWVtcyB0aGUg
QVVESVRfU09GVFdBUkVfVVBEQVRFIGZvcm1hdApkb2VzIG5vdCBhcHBlYXIgdG8gYmUgZG9jdW1l
bnRlZCwgc28gd2hpbGUgbG9va2luZyBpbnRvIGFsbCB0aGlzLCBnb3QKc2V2ZXJhbCBxdWVzdGlv
bnMuCgogIFtSXSA8aHR0cHM6Ly9idWdzLmRlYmlhbi5vcmcvOTMxNzQ4PgoKPkZyb20gdGhlIHJw
bSBpbXBsZW1lbnRhdGlvbiBhbmQgYXVwYXJzZS9ub3JtYWxpemUuYyBJIGdhdGhlciB0aGF0IGl0
CndvdWxkIGNvbnRhaW4gdGhlIGZvbGxvd2luZyBmaWVsZHMsIGFwcGxpZWQgdG8gZHBrZzoKCiAg
KiBwcmltYXJ5IGZpZWxkIHdvdWxkIGJlICJzdyIgd2hpY2ggd291bGQgY29udGFpbiBzb21ldGhp
bmcgbGlrZQogICAgwqsibmdpbnhfMS4xOC4wLTVfYW1kNjQiwrssIEkgYXNzdW1lIHRoYXQgdGhl
IGZvcm1hdCBkaWZmZXJpbmcgZnJvbQogICAgdGhlIG9uZSBpbiBycG0gaXMgZmluZSBhcyB0aGF0
IHdvdWxkIGJlIGtleWVkIG9uIHRoZSBuZXh0IGZpZWxkPwogICogc2Vjb25kYXJ5IGZpZWxkIHdv
dWxkIGJlICJzd190eXBlIiB3aGljaCB3b3VsZCBiZSDCq2Rwa2fCuy4KICAqIGZpZWxkICJvcCIs
IHdoaWNoIHdvdWxkIGNvbnRhaW4gZW50cmllcyBkaWZmZXJlbnQgdG8gcnBtLCBzdWNoIGFzCiAg
ICDCq3VucGFja8K7LCDCq2NvbmZpZ3VyZcK7LCDCq2luc3RhbGzCuywgwqtyZW1vdmXCuywgwqtw
dXJnZcK7LCBub3Qgc3VyZSBpZgogICAgdGhhdCBtaWdodCBiZSBhIHByb2JsZW0/CiAgKiBmaWVs
ZCAia2V5X2VuZm9yY2UiLCBJIHRha2UgdG8gZGVub3RlIHdoZXRoZXIgYSBjcnlwdG9ncmFwaGlj
CiAgICB2ZXJpZmljYXRpb24gaGFzIGJlZW4gcGVyZm9ybWVkIG9uIHRoZSAuZGViIGFyY2hpdmU/
IFdpdGggdmFsdWVzCiAgICDCqzDCuyBvciDCqzHCuy4gKFRoaXMgd291bGQgZGVwZW5kIG9uIHdo
ZXRoZXIgZGVic2lnLXZlcmlmeSgxKSBoYXMKICAgIGJlZW4gY29uZmlndXJlZCB0byBiZSBleGVj
dXRlZCBvciBub3QuKQogICogZmllbGQgImdwZ19yZXMiLCB0byBkZW5vdGUgd2hldGhlciB0aGUg
YWZvcmVtZW50aW9uZWQgdmVyaWZpY2F0aW9uCiAgICBzdWNjZWVkZWQgb3Igbm90PyBXaXRoIHZh
bHVlcyDCqzDCuyBvciDCqzHCuy4gQW5kIHdoaWxlIGRwa2cgY2FuIGluZGVlZAogICAgdXNlIEdu
dVBHIHRvIHZlcmlmeSBzaWduYXR1cmVzIGZyb20gYXJjaGl2ZXMsIHRoZSBuYW1lIGZlZWxzIHRv
bwogICAgaW1wbGVtZW50YXRpb24gc3BlY2lmaWMsIHBlcmhhcHMgaXQgY291bGQgYmUgcmVuYW1l
ZCBzbyB0aGF0IGl0CiAgICB3b3VsZCBub3QgYmUgdmVyeSBjb25mdXNpbmcsIGluIGNhc2Ugc29t
ZW9uZSBpbXBsZW1lbnRzIGEgY2hlY2sKICAgIGJhc2VkIG9uIHNheSB4NTA5IGNlcnRpZmljYXRl
cz8KICAqIGZpZWxkICJyb290X2RpciIsIHRvIGRlbm90ZSB0aGUgaW5zdGFsbGF0aW9uIHJvb3Qg
ZGlyZWN0b3J5LCB3aGljaAogICAgd291bGQgbWFwIHRvIGRwa2cgLS1pbnN0ZGlyIHZhbHVlLCB3
aXRoIGEgdmFsdWUgc3VjaCBhcyDCqyIvIsK7LgoKQW55dGhpbmcgZWxzZSBJIG1pZ2h0IGhhdmUg
bWlzc2VkIG9yIG1pZ2h0IGJlIHdvcnRoIHRha2luZyBpbnRvCmFjY291bnQgd2hpbGUgYWRkaW5n
IHRoZSBzdXBwb3J0PwoKVGhhbmtzLApHdWlsbGVtCgoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBs
aXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWF1ZGl0

